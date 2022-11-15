local status, heirline = pcall(require, "heirline")
if not status then
    return
end
local status1, gitsigns = pcall(require, "gitsigns")
if not status1 then
    return
end

gitsigns.setup({signcolumn = false})

local conditions = require("heirline.conditions")
local utils = require("heirline.utils")

local colors = {
    yellow = "#ecbe7b",
    yellow_1 = "#ff9640",
    darkgrey = "#3c3836",
    -- cyan = "#008080",
    cyan = utils.get_highlight("Constant").fg,
    green = "#b8bb26",
    orange = "#d79921",
    blue = "#458588",
    red = "#cc241d",
    grey = "#404c51",
    none = "#7e8b83"
}
heirline.load_colors(colors)

local block = { provider = "▊", hl = { fg = "blue" } }
local separator = { provider = "  ", }
local Align = { provider = "%=" }

local ViMode = {
    init = function(self)
        self.mode = vim.fn.mode(1)

        if not self.once then
            vim.api.nvim_create_autocmd("ModeChanged", {
                pattern = "*:*o",
                command = 'redrawstatus'
            })
            self.once = true
        end
    end,

    static = {
        mode_names = {
            n = "NORMAL",
            no = "NORMAL",
            nov = "NORMAL",
            noV = "NORMAL",
            ["no\22"] = "NORMAL",
            niI = "NORMAL",
            niR = "NORMAL",
            niV = "NORMAL",
            nt = "NORMAL",
            v = "VISUAL",
            vs = "VISUAL",
            V = "VISUAL",
            Vs = "VISUAL",
            ["\22"] = "VISUAL",
            ["\22s"] = "VISUAL",
            s = "VISUAL",
            S = "VISUAL",
            ["\19"] = "VISUAL",
            i = "INSERT",
            ic = "INSERT",
            ix = "INSERT",
            R = "REPLACE",
            Rc = "REPLACE",
            Rx = "REPLACE",
            Rv = "REPLACE",
            Rvc = "REPLACE",
            Rvx = "REPLACE",
            c = "COMMAND",
            cv = "COMMAND",
            r = "REPLACE",
            rm = "REPLACE",
            ["r?"] = "REPLACE",
            ["!"] = "!",
            t = "TERMINAL",
        },
        mode_colors = {
            n = "green" ,
            i = "cyan",
            v = "cyan",
            V =  "cyan",
            ["\22"] =  "cyan",
            c =  "orange",
            s =  "purple",
            S =  "purple",
            ["\19"] =  "purple",
            R =  "orange",
            r =  "orange",
            ["!"] =  "blue",
            t =  "blue",
        }
    },

    provider = function(self)
        return "%2("..self.mode_names[self.mode].."%)"
    end,

    hl = function(self)
        local mode = self.mode:sub(1, 1)
        return { fg = self.mode_colors[mode], bold = true, }
    end,

    update = {
        "ModeChanged",
    },
}

local FileIcon = {
    provider = function(self)
        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":t")
        if filename == "" then return "" end
        local extension = vim.fn.fnamemodify(filename, ":e")
        self.icon, self.icon_color = require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })
        return self.icon and (self.icon .. "")
    end,
    hl = function(self)
        return { fg = self.icon_color }
    end
}

local FileName = {
    provider = function()
        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":t")
        if filename == "" then return "" end
        return filename
    end,
}

local FileFlags = {
    {
        condition = function()
            return vim.bo.modified
        end,
        provider = " [+]",
    },
    {
        condition = function()
            return not vim.bo.modifiable or vim.bo.readonly
        end,
        provider = function()
            local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":t")
            if filename == "" then return "" end
            return " "
        end,
        hl = { fg = "none" },
    },
}

local FileLastModified = {
    provider = function()
        local ftime = vim.fn.getftime(vim.api.nvim_buf_get_name(0))
        return (ftime > 0) and os.date("%x", ftime)
    end,
    hl = { fg = "none" }
}

local Ruler = {
    provider = "%l:%c %P",
    hl = { fg = "none" }
}

local ScrollBar = {
    static = {
        sbar = { '▁', '▂', '▃', '▄', '▅', '▆', '▇', '█' }
        -- sbar = { '🭶', '🭷', '🭸', '🭹', '🭺', '🭻' }
    },
    provider = function(self)
        local curr_line = vim.api.nvim_win_get_cursor(0)[1]
        local lines = vim.api.nvim_buf_line_count(0)
        local i = math.floor((curr_line - 1) / lines * #self.sbar) + 1
        return string.rep(self.sbar[i], 2)
    end,
    hl = { fg = "yellow" },
}

local LSPActive = {
    {
        provider = "  "
    },
    {
        condition = function() return conditions.lsp_attached() end,
        provider = function()
            local names = {}
            for _, server in pairs(vim.lsp.buf_get_clients(0)) do
                table.insert(names, server.name)
            end
            return table.concat(names, ", ")
        end,
    },
    {
        condition = function() return not conditions.lsp_attached() end,
        provider = function()
            return "Inactive"
        end,
    },

    on_click = {
        callback = function()
            vim.cmd("LspInfo")
        end,
        name = "LspInfo",
    },

    hl = { fg = "none" },
}

local GitName = {
    condition = conditions.is_git_repo,

    init = function(self)
        self.status_dict = vim.b.gitsigns_status_dict
        self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
    end,

    {
        provider = function(self)
            return " " .. self.status_dict.head
        end,
        hl = { fg = "cyan" },

    },
    {separator}
}

local GitChanges = {
    condition = conditions.is_git_repo,

    init = function(self)
        self.status_dict = vim.b.gitsigns_status_dict
        self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
    end,

    {
        provider = function(self)
            local count = self.status_dict.added or 0
            return count > 0 and (" " .. count .. " ")
        end,
        hl = { fg = "green" },
    },
    {
        provider = function(self)
            local count = self.status_dict.removed or 0
            return count > 0 and (" " .. count .. " ")
        end,
        hl = { fg = "red" },
    },
    {
        provider = function(self)
            local count = self.status_dict.changed or 0
            return count > 0 and ("柳" .. count .. " ")
        end,
        hl = { fg = "orange" },
    },

    on_click = {
        callback = function()
            vim.defer_fn(function()
                vim.cmd("lua _LAZYGIT_TOGGLE()")
            end, 100)
        end,
        name = "lazygit",
    },

    {separator}
}

local TexCompilation = {
    condition = function() return conditions.buffer_matches({ filetype = { "tex" } }) end,
    provider = function()
        if vim.b.vimtex["compiler"]["status"] == -1 or vim.b.vimtex["compiler"]["status"] == 0 then
            return "{✗}"
        end

        if vim.b.vimtex["compiler"]["continuous"] == 1 then
            if vim.b.vimtex["compiler"]["status"] == 1 then
                return "{⋯}"
            else
                return "{✓}"
            end
        else
            return "{✗}"
        end
    end,
    hl = { fg = "none" },
    {separator}
}

local WordCount = {
    condition = function() return conditions.buffer_matches({ filetype = { "tex" } }) end,
    provider = function()
        return "Words: " .. tostring(vim.fn.wordcount().words)
    end,
    hl = { fg = "none" },
    {separator}
}

local TS = {
    provider = function()
        local b = vim.api.nvim_get_current_buf()
        local x = vim.treesitter.highlighter.active[b]
        if x ~= nil then
            if next(vim.treesitter.highlighter.active[b]) then
                return "綠TS"
            end
        end
        -- return ""
        return " TS"
    end,
    hl = { fg = "green" }
}

local statusline = {
    condition = function()
        return vim.bo.filetype ~= "startify" and vim.bo.filetype ~= "NvimTree"
    end,
    {block, separator, ViMode, separator},
    {GitName},
    {FileName, FileFlags, separator},
    {GitChanges},
    {Align},
    {FileIcon, separator},
    {TexCompilation, WordCount},
    {FileLastModified},
    {separator},
    {LSPActive},
    {separator},
    {TS},
    {separator},
    {Ruler, separator, ScrollBar, separator, block},
    hl = { bg = "grey" }
}

local winbar = {}
local tabline = {}

heirline.setup(statusline)
