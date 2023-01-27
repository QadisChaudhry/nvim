local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    return
end

local actions = require("telescope.actions")
local builtin = require("telescope.builtin")
local sorters = require("telescope.sorters")

telescope.setup({
    defaults = {
        layout_strategy = "vertical",
        layout_config = { preview_cutoff = 30 },
        file_sorter = sorters.get_fzy_sorter,
        mappings = {
            i = {
                ["<esc>"] = actions.close,
            },
        },
        -- path_display = { "smart" }
    },
    extensions = {
        file_browser = {
            -- theme = "ivy",
            -- hijack_netrw = true,
            mappings = {
                ["i"] = {},
                ["n"] = {}
            }
        }
    }
})

telescope.load_extension("neoclip")
telescope.load_extension("file_browser")
telescope.load_extension("undo")

local M = {}

M.school = function ()
    builtin.find_files({
        prompt_title = "College Files",
        cwd = "~/Desktop/College/",
        telescope.setup({
            defaults = {
                file_ignore_patterns = {
                    "%.pdf",
                    "%.png",
                    "%.log",
                    "%.aux",
                    "%.gz",
                    "%.fdb_latexmk",
                    "%.fls",
                    "%.class"
                }
            }
        })
    })
end

M.vrc = function ()
    builtin.find_files({
        prompt_title = "Vim Config",
        cwd = "~/.config/nvim/",
        telescope.setup{
            defaults = {
                file_ignore_patterns = {
                    "plugged",
                    "undodir",
                    "autoload"
                }
            }
        }
    })
end

M.proj = function ()
    builtin.find_files({
        prompt_title = "Projects",
        cwd = "~/Projects/",
        telescope.setup{
            defaults = {
                file_ignore_patterns = {
                    "%.DS_Store",
                    "%/__pycache__"
                }
            }
        }
    })
end

return M
