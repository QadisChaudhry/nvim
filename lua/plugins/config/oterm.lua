local status, oterm = pcall(require, "oterm")
if not status then
    return
end

local open = require("oterm").open

local config = {
  command = nil,
  name = "Terminal",
  layout = "center",
  keymaps = { exit = "<esc>" },
  terminal_hl = nil,
  split_hl = nil,
  width = 0.8,
  height = 0.8,
  row = 0,
  col = 0,
  win_api = { style = "minimal", relative = "editor", border = "rounded" },
}

oterm.setup(config)

function _OPEN_TERM() open() end

function _LAZYGIT_TOGGLE() open({name = "Github", command = "lazygit"}) end
function _PYTHON_TOGGLE() open({name = "Python", layout = "hsplit", command = "ipython"}) end
function _RANGER_TOGGLE() open({name = "File Explorer", layout = "vsplit", command = "ranger"}) end
function _THOKR_TOGGLE() open({name = "Typing Test", layout = "hsplit", command = "thokr"}) end
