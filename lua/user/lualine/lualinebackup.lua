local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    return
end

local compile_status = function()
    if vim.bo.filetype == "tex" then
        -- Status: not started or stopped
        if vim.b.vimtex["compiler"]["status"] == -1 or vim.b.vimtex["compiler"]["status"] == 0 then
            -- return ""
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

        -- Status: running
        -- if vim.b.vimtex["compiler"]["status"] == 1 then
        --     return "{⋯}"
            -- -- Status: compile success
        -- elseif vim.b.vimtex["compiler"]["status"] == 2 then
            -- return "{✓}"
            -- -- Status: compile failed
        -- elseif vim.b.vimtex["compiler"]["status"] == 3 then
            -- return "{✗}"
        end
    else
        return ""
    end
end

local progress_bar = function()
  local current_line = vim.fn.line "."
  local total_lines = vim.fn.line "$"
  local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
  local line_ratio = current_line / total_lines
  local index = math.ceil(line_ratio * #chars)
  return chars[index]
end

local config = {
    options = {
        icons_enabled = true,
        theme = 'auto',
        -- component_separators = { left = '', right = ''},
        component_separators = { left = '' },
        section_separators = { left = '', right = ''},
        disabled_filetypes = { "NvimTree", "startify" },
        always_divide_middle = true,
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {compile_status,'filetype'},
        lualine_y = {'location'},
        lualine_z = {'progress', progress_bar}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = { "nvim-tree", "toggleterm" }
}

lualine.setup(config)
