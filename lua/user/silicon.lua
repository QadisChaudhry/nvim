local status, silicon = pcall(require, "silicon")
if not status then
    return
end

-- local date = string.format("%s-%s-%s", os.date("%Y"), os.date("%m"), os.date("%d"))
-- local time = string.format("%s.%s.%s %s", os.date("%I"), os.date("%M"), os.date("%S"), os.date("%p"):upper())

local config = {
    theme = "auto",
    -- output = string.format("%s/Documents/Screenshots/Code %s at %s.png", vim.fn.expand("~"), date, time),
    output = string.format("%s/Documents/Screenshots/Code.png", vim.fn.expand("~")),
    -- bgColor = vim.g.terminal_color_5,
    bgColor = "#c7c7c7",
    bgImage = "", -- path to image, must be png
    roundCorner = true,
    windowControls = true,
    lineNumber = false,
    -- font = "JetBrainsMono Nerd Font",
    font = "Iosevka Nerd Font",
    lineOffset = 1, -- from where to start line number
    linePad = 2, -- padding between lines
    padHoriz = 80, -- Horizontal padding
    padVert = 100, -- vertical padding
    shadowBlurRadius = 10,
    shadowColor = "#555555",
    shadowOffsetX = 8,
    shadowOffsetY = 8,
    gobble = false, -- enable lsautogobble like feature
    debug = false, -- enable debug output
}

silicon.setup(config)
