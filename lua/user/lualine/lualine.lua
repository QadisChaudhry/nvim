local status = require("user.lualine.status")

local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    return
end

local colors = {
    yellow = "#ecbe7b",
    yellow_1 = "#ff9640",
    darkgrey = "#3c3836",
    cyan = "#008080",
    green = "#b8bb26",
    orange = "#d79921",
    blue = "#458588",
    red = "#cc241d",
}

local function cols()
    return {
        normal = {
            a = {bg = colors.darkgrey, gui = 'bold'},
            b = {bg = colors.darkgrey},
            c = {bg = colors.darkgrey}
        },
        insert = {
            a = {bg = colors.darkgrey, gui = 'bold'},
            b = {bg = colors.darkgrey},
            c = {bg = colors.darkgrey}
        },
        visual = {
            a = {bg = colors.darkgrey, gui = 'bold'},
            b = {bg = colors.darkgrey},
            c = {bg = colors.darkgrey}
        },
        replace = {
            a = {bg = colors.darkgrey},
            b = {bg = colors.darkgrey},
            c = {bg = colors.darkgrey}
        },
        command = {
            a = {bg = colors.darkgrey, gui = 'bold'},
            b = {bg = colors.darkgrey},
            c = {bg = colors.darkgrey}
        },
    }
end

local conditions = {
    buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand "%:t") ~= 1
    end,
    hide_in_width = function()
        return vim.fn.winwidth(0) > 80
    end,
    check_git_workspace = function()
        local filepath = vim.fn.expand "%:p:h"
        local gitdir = vim.fn.finddir(".git", filepath .. ";")
        return gitdir and #gitdir > 0 and #gitdir < #filepath
    end,
}

local theme_colors = function ()
    if vim.g.colors_name == "gruvbox" then
        return cols()
    else
        return "auto"
    end
end

local config = {
    options = {
        disabled_filetypes = { "NvimTree", "startify" },
        component_separators = "",
        section_separators = "",
        theme = theme_colors()
    },
    sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {},
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {},
    },
}

local function ins_left(component)
    table.insert(config.sections.lualine_c, component)
end

local function ins_right(component)
    table.insert(config.sections.lualine_x, component)
end

ins_left {
    function()
        return "???"
    end,
    color = { fg = colors.blue },
    padding = { left = 0, right = 0 },
}

ins_left {
    "mode",
    color = { fg = colors.green, gui = "bold" },
    padding = { left = 2, right = 1 },
}

ins_left {
    "branch",
    icon = "???",
    color = { fg = colors.green, gui = "bold" },
    padding = { left = 1, right = 1 },
}

ins_left {
    "%t %m",
    cond = conditions.buffer_not_empty,
    color = { fg = '#a6b0a0', gui = "bold" },
    padding = { left = 1, right = 1 },
}

ins_left {
    "diff",
    symbols = { added = "??? ", modified = "???", removed = "??? " },
    diff_color = {
        added = { fg = colors.green },
        modified = { fg = colors.yellow_1 },
        removed = { fg = colors.red },
        },
        cond = conditions.hide_in_width,
        padding = { left = 0, right = 1 },
    }

-- ins_left {
-- "diagnostics",
-- sources = { "nvim_diagnostic" },
-- symbols = { error = "??? ", warn = "??? ", info = "??? ", hint = "??? " },
-- diagnostics_color = {
--   color_error = { fg = colors.red },
--   color_warn = { fg = colors.yellow },
--   color_info = { fg = colors.cyan },
-- },
-- padding = { left = 2, right = 1 },
-- }

ins_left {
    function()
        return "%="
    end,
}

local compile_status = function()
    if vim.bo.filetype == "tex" then
        -- Status: not started or stopped
        if vim.b.vimtex["compiler"]["status"] == -1 or vim.b.vimtex["compiler"]["status"] == 0 then
            -- return ""
            return "{???}"
        end

        if vim.b.vimtex["compiler"]["continuous"] == 1 then
            if vim.b.vimtex["compiler"]["status"] == 1 then
                return "{???}"
            else
                return "{???}"
            end
        else
            return "{???}"

        -- Status: running
        -- if vim.b.vimtex["compiler"]["status"] == 1 then
        --     return "{???}"
            -- -- Status: compile success
        -- elseif vim.b.vimtex["compiler"]["status"] == 2 then
            -- return "{???}"
            -- -- Status: compile failed
        -- elseif vim.b.vimtex["compiler"]["status"] == 3 then
            -- return "{???}"
        end
    else
        return ""
    end
end

local function wordcount()
    if vim.bo.filetype == "tex" then
        local string = "Words: " .. tostring(vim.fn.wordcount().words)
        return string
    else
        return ""
    end
end

ins_right {
    compile_status,
    color = { fg = '#a6b0a0', gui = "bold" },
    padding = { left = 0, right = 2 },
}

ins_right {
    wordcount,
    color = { gui = "bold" },
    padding = { left = 0, right = 2 },
}

ins_right {
    status.lsp_progress,
    color = { gui = "none" },
    padding = { left = 0, right = 1 },
    cond = conditions.hide_in_width,
}

ins_right {
    status.lsp_name,
    icon = "??? ",
    color = { gui = "none" },
    padding = { left = 0, right = 1 },
    cond = conditions.hide_in_width,
}

ins_right {
    status.treesitter_status,
    color = { fg = colors.green },
    padding = { left = 1, right = 1 },
    cond = conditions.hide_in_width,
}

ins_right {
    "location",
    padding = { left = 1, right = 1 },
}

ins_right {
    "progress",
    color = { gui = "none" },
    padding = { left = 0, right = 0 },
}

ins_right {
    status.progress_bar,
    padding = { left = 1, right = 1 },
    color = { fg = colors.yellow },
    cond = nil,
}

ins_right {
    function()
        return "???"
    end,
    color = { fg = colors.blue },
    padding = { left = 1, right = 0 },
}

lualine.setup(config)
