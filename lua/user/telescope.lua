local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    return
end

local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

telescope.setup{
    defaults = {
        layout_strategy = 'vertical',
        -- layout_config = { height = 0.95 },
        file_sorter = require('telescope.sorters').get_fzy_sorter,
        mappings = {
            i = {
                ["<esc>"] = actions.close,
            },
        },
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true
        }
    }
}

telescope.load_extension('fzy_native')

local M = {}

M.school = function ()
    builtin.find_files({
        prompt_title = "College Files",
        cwd = "~/Desktop/College/Second Year/Second Semester",
        telescope.setup{ defaults = { file_ignore_patterns = {"%.pdf", "%.png", "%.log", "%.aux", "%.gz", "%.fdb_latexmk", "%.fls"} } }
    })
end

M.vrc = function ()
    builtin.find_files({
        prompt_title = "Vim Config",
        cwd = "~/.config/nvim/",
        telescope.setup{ defaults = { file_ignore_patterns = {"plugged", "undodir", "autoload"} } }
    })
end

return M
