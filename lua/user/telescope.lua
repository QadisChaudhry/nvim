local actions = require('telescope.actions')
require('telescope').setup{
    defaults = {
        layout_strategy = 'vertical',
        layout_config = { height = 0.95 },
        file_sorter = require('telescope.sorters').get_fzy_sorter,
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true
        }
    }
}

require('telescope').load_extension('fzy_native')
