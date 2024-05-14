vim.o.showcmd = true
vim.opt.path:append("**")
vim.o.belloff = "all"
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.rnu = true
vim.o.nu = true
vim.o.hidden = true
vim.o.hlsearch = false
vim.o.wrap = false
vim.o.swapfile = false
vim.o.backup = false
vim.o.undodir = vim.fn.expand("~") .. "/.config/nvim/undodir"
vim.o.undofile = true
vim.o.incsearch = true
vim.o.encoding = "utf-8"
vim.o.signcolumn = "yes"
vim.o.cursorline = true
vim.o.scroll = 10
vim.o.scrolloff = 8
vim.o.updatetime = 50
vim.o.cmdheight = 1
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.ruler = false
vim.o.autochdir = true
vim.o.mouse = ""

vim.g.netrw_banner = 0

vim.o.termguicolors = true
vim.o.background = "dark"

if vim.g.colors_name == "everforest" then
    vim.cmd[[hi FloatBorder guibg=#2F383E]]
    vim.cmd[[hi NormalFloat guibg=#2F383E]]
elseif vim.g.colors_name == "kanagawa" then
    vim.cmd[[hi FloatBorder guibg=#1F1F28]]
    vim.cmd[[hi NormalFloat guibg=#1F1F28]]
elseif vim.g.colors_name == "gruvbox" then
    vim.cmd[[hi FloatBorder guibg=#282828]]
    vim.cmd[[hi NormalFloat guibg=#282828]]
end

function SPAWN_NOTE_WINDOW(path)
    local buf = vim.api.nvim_create_buf(false, true)
    local ui = vim.api.nvim_list_uis()[1]
    local width = vim.fn.ceil(ui.width/2)
    local height = vim.fn.ceil(ui.height/2)
    local opts = {
        relative = "editor",
        width = width,
        height = height,
        col = (ui.width - width)/2,
        row = (ui.height - height)/2,
        anchor = "NW",
        style = "minimal",
        border = "rounded",
    }
    vim.api.nvim_open_win(buf, true, opts)
    vim.cmd("e " .. path)
    if vim.fn.expand("%:t") ~= "TODO.md" then
        vim.cmd("norm G")
    end
end
