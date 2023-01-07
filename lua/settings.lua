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
vim.o.nowrap = true
vim.o.noswapfile = true
vim.o.nobackup = true
vim.o.undodir = vim.fn.expand("~") .. "/.config/nvim/undodir"
vim.o.undofile = true
vim.o.incsearch = true
vim.o.encoding = "utf-8"
vim.o.signcolumn = "yes"
vim.o.cursorline = true
vim.o.scroll = 5
vim.o.scrolloff = 8
vim.o.updatetime = 50
vim.o.cmdheight = 1
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.noruler = true
vim.o.autochdir = true
vim.o.mouse = ""

vim.g.netrw_banner = 0

vim.cmd[[
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
]]

vim.cmd[[
au FileType tex setlocal spell wrap linebreak nolist
au FileType markdown setlocal spell wrap linebreak nolist
au FileType markdown nnoremap <silent> <buffer> <cr> :call markdown#SwitchStatus()<cr>
au FileType markdown inoremap <silent> <buffer> ,, -- <c-r>=strftime("%m/%d 11:59 pm")<cr>
au FileType alpha noremap <silent> <buffer> <esc> :bdelete!<cr>
au BufEnter *.keymap set ft=c
" au FileType tex setlocal spell textwidth=80 fo+=t
" hi Normal ctermbg=NONE guibg=NONE
au BufWritePre * call TrimWhitespace()
]]

vim.o.termguicolors = true
vim.o.background = "dark"

if vim.g.colors_name == "everforest" then
    vim.cmd[[hi FloatBorder guibg=#2F383E]]
    vim.cmd[[hi NormalFloat guibg=#2F383E]]
elseif vim.g.colors_name == "kanagawa" then
    vim.cmd[[hi FloatBorder guibg=#1F1F28]]
    vim.cmd[[hi NormalFloat guibg=#1F1F28]]
end
