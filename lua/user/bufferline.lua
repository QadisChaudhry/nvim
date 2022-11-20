local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
    return
end

bufferline.setup({
    options = {
        offsets = {
            { filetype = "NvimTree", text = "File Explorer", text_align = "center", padding = 1 },
        },
        buffer_close_icon = "",
        modified_icon = "",
        close_icon = "",
        show_close_icon = false,
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 14,
        max_prefix_length = 13,
        tab_size = 20,
        show_tab_indicators = true,
        enforce_regular_tabs = false,
        view = "multiwindow",
        show_buffer_close_icons = true,
        separator_style = "thin",
        always_show_bufferline = true,
        diagnostics = false,
    },

    highlights = {
        background = {
            fg = { attribute = "fg", highlight = "BufferLineBackground" },
            bg = { attribute = "bg", highlight = "BufferLineBackground" },
        },

        -- Buffers
        buffer_selected = {
            fg = { attribute = "fg", highlight = "BufferLineBufferSelected" },
            bg = { attribute = "bg", highlight = "BufferLineBufferSelected" },
            -- gui = "NONE",
            underline = false, undercurl = false, italic = false
        },
        buffer_visible = {
            fg = { attribute = "fg", highlight = "BufferLineBufferVisible" },
            bg = { attribute = "bg", highlight = "BufferLineBufferVisible" },
        },

        -- Diagnostics
        error = {
            fg = { attribute = "fg", highlight = "BufferLineError" },
            bg = { attribute = "bg", highlight = "BufferLineError" },
        },
        error_diagnostic = {
            fg = { attribute = "fg", highlight = "BufferLineErrorDiagnostic" },
            bg = { attribute = "bg", highlight = "BufferLineErrorDiagnostic" },
        },

        -- Close buttons
        close_button = {
            fg = { attribute = "fg", highlight = "BufferLineCloseButton" },
            bg = { attribute = "bg", highlight = "BufferLineCloseButton" },
        },
        close_button_visible = {
            fg = { attribute = "fg", highlight = "BufferLineCloseButtonVisible" },
            bg = { attribute = "bg", highlight = "BufferLineCloseButtonVisible" },
        },
        close_button_selected = {
            fg = { attribute = "fg", highlight = "BufferLineCloseButtonSelected" },
            bg = { attribute = "bg", highlight = "BufferLineCloseButtonSelected" },
        },
        fill = {
            fg = { attribute = "fg", highlight = "BufferLineFill" },
            bg = { attribute = "bg", highlight = "BufferLineFill" },
        },
        indicator_selected = {
            fg = { attribute = "fg", highlight = "BufferLineIndicatorSelected" },
            bg = { attribute = "bg", highlight = "BufferLineIndicatorSelected" },
        },

        -- Modified
        modified = {
            fg = { attribute = "fg", highlight = "BufferLineModified" },
            bg = { attribute = "bg", highlight = "BufferLineModified" },
        },
        modified_visible = {
            fg = { attribute = "fg", highlight = "BufferLineModifiedVisible" },
            bg = { attribute = "bg", highlight = "BufferLineModifiedVisible" },
        },
        modified_selected = {
            fg = { attribute = "fg", highlight = "BufferLineModifiedSelected" },
            bg = { attribute = "bg", highlight = "BufferLineModifiedSelected" },
        },

        -- Separators
        separator = {
            fg = { attribute = "fg", highlight = "BufferLineSeparator" },
            bg = { attribute = "bg", highlight = "BufferLineSeparator" },
        },
        separator_visible = {
            fg = { attribute = "fg", highlight = "BufferLineSeparatorVisible" },
            bg = { attribute = "bg", highlight = "BufferLineSeparatorVisible" },
        },
        separator_selected = {
            fg = { attribute = "fg", highlight = "BufferLineSeparatorSelected" },
            bg = { attribute = "bg", highlight = "BufferLineSeparatorSelected" },
        },

        -- Tabs
        tab = {
            fg = { attribute = "fg", highlight = "BufferLineTab" },
            bg = { attribute = "bg", highlight = "BufferLineTab" },
        },
        tab_selected = {
            fg = { attribute = "fg", highlight = "BufferLineTabSelected" },
            bg = { attribute = "bg", highlight = "BufferLineTabSelected" },
        },
        tab_close = {
            fg = { attribute = "fg", highlight = "BufferLineTabClose" },
            bg = { attribute = "bg", highlight = "BufferLineTabClose" },
        },
    },
})
