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
    -- cyan = utils.get_highlight("Statement").fg,
    green = "#b8bb26",
    orange = "#d79921",
    blue = "#458588",
    red = "#cc241d",
    grey = "#404c51",
    none = "#7e8b83",
    bg = utils.get_highlight("Folded").bg,
}

heirline.load_colors(colors)

local block = { provider = "▊", hl = { fg = "cyan" } }
-- local block = { provider = "▊", hl = { fg = utils.get_highlight("Function").fg } }
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
            s =  "cyan",
            S =  "cyan",
            ["\19"] =  "cyan",
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
        if filename == "" then return "[No Name]" end
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
            if self.status_dict.head == "" then
                return " master"
            end
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
    -- condition = function() return conditions.buffer_matches({ filetype = { "tex" } }) end,
    condition = function()
        return vim.bo.filetype == "tex"
    end,
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
    -- condition = function() return conditions.buffer_matches({ filetype = { "tex" } }) end,
    condition = function()
        return vim.bo.filetype == "tex"
    end,
    provider = function()
        return "Words: " .. tostring(vim.fn.wordcount().words)
    end,
    hl = { fg = "none" },
    {separator}
}

local TreeSitter = {
    provider = function()
        local b = vim.api.nvim_get_current_buf()
        if vim.treesitter.highlighter.active[b] ~= nil then
            return "綠TS"
        end
        return " TS"
    end,
    hl = { fg = "green" }
}

local statusline = {
    condition = function()
        return vim.bo.filetype ~= "alpha" and vim.bo.filetype ~= "NvimTree"
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
    {TreeSitter},
    {separator},
    {Ruler, separator, ScrollBar, separator, block},
    hl = { bg = "bg" }
}

local TablineFileFlags = {
    {
        condition = function(self)
            return vim.api.nvim_buf_get_option(self.bufnr, "modified")
        end,
        provider = "    ",
        hl = { fg = "cyan" },
    },
    {
        condition = function(self)
            return not vim.api.nvim_buf_get_option(self.bufnr, "modified")
        end,
        provider = "    ",
        hl = { fg = "cyan" },
        on_click = {
            callback = function(_, minwid)
                vim.api.nvim_buf_delete(minwid, { force = false })
            end,
            minwid = function(self)
                return self.bufnr
            end,
            name = "heirline_tabline_close_buffer_callback",
        },
    },
    {
        condition = function(self)
            return not vim.api.nvim_buf_get_option(self.bufnr, "modifiable")
                or vim.api.nvim_buf_get_option(self.bufnr, "readonly")
        end,
        provider = function(self)
            if vim.api.nvim_buf_get_option(self.bufnr, "buftype") == "terminal" then
                return "  "
            else
                return "    "
            end
        end,
        hl = { fg = "cyan" },
    },
}

local TablineFileIcon = {
    provider = function(self)
        local fileicon = self.fileicon
        return fileicon
    end,
    hl = function(self)
        return { fg = self.icon_color }
    end
}

local TablineFileName = {
    provider = function(self)
        local filename = self.filename
        filename = filename == "" and "[No Name]" or vim.fn.fnamemodify(filename, ":t")
        return filename
    end,
}

local TablineFileNameBlock = {
    init = function(self)
        self.filename = vim.api.nvim_buf_get_name(self.bufnr)
        local extension = vim.fn.fnamemodify(self.filename, ":e")
        self.fileicon, self.icon_color = require("nvim-web-devicons").get_icon_color(self.filename, extension, { default = true })
    end,
    hl = function(self)
        if self.is_active then
            return { bold = false }
        else
            return { fg = "none", bold = false }
        end
    end,
    on_click = {
        callback = function(_, minwid, _, button)
            if (button == "m") then -- close on mouse middle click
                vim.api.nvim_buf_delete(minwid, {force = false})
            else
                vim.api.nvim_win_set_buf(0, minwid)
            end
        end,
        minwid = function(self)
            return self.bufnr
        end,
        name = "heirline_tabline_buffer_callback",
    },
    { provider = "▎  ", hl = { fg = "cyan" } },
    TablineFileIcon,
    { provider = " " },
    TablineFileName,
    TablineFileFlags,
}

local TreeOffset = {
    condition = function(self)
        local win = vim.api.nvim_tabpage_list_wins(0)[1]
        local bufnr = vim.api.nvim_win_get_buf(win)
        self.winid = win

        if vim.bo[bufnr].filetype == "NvimTree" then
            self.title = "File Explorer"
        end
        return vim.bo.filetype == "NvimTree"
    end,

    provider = function(self)
        local title = self.title
        local width = vim.api.nvim_win_get_width(self.winid)
        local pad = math.ceil((width - #title) / 2)
        -- return string.rep(" ", pad-1) .. title .. string.rep(" ", pad-1)
        return string.rep(" ", pad) .. title .. string.rep(" ", pad)
    end,

    hl = { fg = "none" }
}

local BufferLine = utils.make_buflist(
    TablineFileNameBlock,
    {
        condition = function()
            return vim.bo.filetype ~= "NvimTree"
        end,
        provider = " ", hl = { fg = "grey" }
    },
    {
        condition = function()
            return vim.bo.filetype ~= "NvimTree"
        end,
        provider = "", hl = { fg = "grey" }
    }
)

local tabline = {
    condition = function()
        return vim.bo.filetype ~= "alpha" and vim.bo.buftype ~= "help"
        -- return not conditions.buffer_matches({ filetype = { "alpha", "help" } })
    end,
    { TreeOffset, BufferLine }
}

vim.cmd[[hi TabLineFill guifg=NONE guibg=NONE]]
vim.o.showtabline = 2

heirline.setup({
    statusline = statusline,
    winbar = nil,
    tabline = tabline,
    statuscolumn = nil
})
