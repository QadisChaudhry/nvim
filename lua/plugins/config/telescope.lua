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
            },
            hidden = true,
            git_status = false,
            grouped = true
        }
    }
})

telescope.load_extension("neoclip")
telescope.load_extension("file_browser")
telescope.load_extension("undo")

local M = {}

M.vrc = function ()
    builtin.find_files({
        prompt_title = "Vim Config",
        cwd = "~/.config/nvim/",
        telescope.setup {
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

M.ztlk = function ()
    builtin.find_files({
        prompt_title = "Zettelkasten",
        cwd = "~/zettelkasten/",
        layout_strategy = "horizontal",
        telescope.setup {
            defaults = {
                file_ignore_patterns = {
                    "!(*.md)"
                }
            }
        }
    })
end

-- M.school = function ()
--     builtin.find_files({
--         prompt_title = "College Files",
--         cwd = "~/Documents/College/",
--         telescope.setup({
--             defaults = {
--                 file_ignore_patterns = {
--                     "%.pdf",
--                     "%.png",
--                     "%.jpg",
--                     "%.log",
--                     "%.aux",
--                     "%.gz",
--                     "%.fdb_latexmk",
--                     "%.fls",
--                     "%.class"
--                 }
--             }
--         })
--     })
-- end

-- M.proj = function ()
--     builtin.find_files({
--         prompt_title = "Projects",
--         cwd = "~/Projects/",
--         telescope.setup {
--             defaults = {
--                 file_ignore_patterns = {
--                     "%.DS_Store",
--                     "%/__pycache__"
--                 }
--             }
--         }
--     })
-- end

return M
