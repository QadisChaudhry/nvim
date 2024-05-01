local status, silicon = pcall(require, "silicon")
if not status then
    return
end

-- local date = string.format("%s-%s-%s", os.date("%Y"), os.date("%m"), os.date("%d"))
-- local time = string.format("%s.%s.%s %s", os.date("%I"), os.date("%M"), os.date("%S"), os.date("%p"):upper())

local config = {
    disable_defaults = false,
    debug = false,
    font = "Iosevka Nerd Font",
    theme = "everforest_dark",
    background = "#c7c7c7",
    background_image = nil,
    pad_horiz = 80,
    pad_vert = 100,
    no_round_corner = false,
    no_window_controls = false,
    no_line_number = true,
    line_offset = 1,
    line_pad = 2,
    tab_width = 4,
    language = function()
    	return vim.bo.filetype
    end,
    shadow_blur_radius = 10,
    shadow_offset_x = 8,
    shadow_offset_y = 8,
    shadow_color = "#555555",
    gobble = true,
    num_separator = nil,
    to_clipboard = false,
    command = "silicon",
    output = function()
    	return vim.fn.expand("~") .. "/Documents/Screenshots/Code.png"
    end,
}

silicon.setup(config)
