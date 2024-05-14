local status_ok, minifiles = pcall(require, "mini.files")
if not status_ok then
    return
end

local config = {
    content = {
        filter = nil,
        prefix = nil,
        sort = nil,
    },

    mappings = {
        close       = '<esc>',
        go_in       = 'L',
        go_in_plus  = 'l',
        go_out      = 'h',
        go_out_plus = '-',
        reset       = '<BS>',
        reveal_cwd  = '@',
        show_help   = 'g?',
        synchronize = '<leader>w',
        trim_left   = '<',
        trim_right  = '>',
    },

    options = {
        permanent_delete = true,
        use_as_default_explorer = true,
    },

    windows = {
        max_number = math.huge,
        preview = false,
        width_focus = 50,
        width_nofocus = 30,
        width_preview = 25,
    },
}

minifiles.setup(config)
