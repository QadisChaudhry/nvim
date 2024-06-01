local status, oterm = pcall(require, "oterm")
if not status then
    return
end

local config = {
    command = nil,
    name = "Terminal",
    layout = "center",
    keymaps = { exit = "<c-c>" },
    terminal_hl = nil,
    split_hl = nil,
    width = 0.8,
    height = 0.8,
    row = 0,
    col = 0,
    win_api = { style = "minimal", relative = "editor", border = "rounded" },
}

oterm.setup(config)

function _OPEN_TERM() oterm.open({keymaps = { exit = "<esc>", normal = "<esc>" }}) end

function _LAZYGIT_TOGGLE() oterm.open({name = "Github", command = "lazygit"}) end
function _PYTHON_TOGGLE() oterm.open({name = "Python", command = "ipython", keymaps = { exit = "<esc>", normal = "<esc>" }}) end
function _RANGER_TOGGLE() oterm.open({name = "File Explorer", layout = "vsplit", command = "ranger"}) end
function _THOKR_TOGGLE() oterm.open({name = "Typing Test", layout = "hsplit", command = "thokr"}) end
