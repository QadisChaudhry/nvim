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
vim.o.scroll = 5
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

local au = vim.api.nvim_create_autocmd
local map = vim.keymap.set
local opts = { noremap = true, silent = true, buffer = true }

au("FileType", {
    pattern = "*",
    callback = function()
        if vim.bo.filetype ~= "tex" and vim.bo.filetype ~= "markdown" and vim.bo.filetype ~= "json" then
            vim.opt_local.textwidth = 120
            vim.opt_local.fo:append("t")
        end
    end
})

au("BufEnter", {
    pattern = "*",
    callback = function()
        if vim.fn.expand("%:t") == "TODO.md" then
            map("n", "<cr>", ":call markdown#SwitchStatus()<cr>", opts)
            map("i", ",,", "-- <c-r>=strftime('%m/%d 11:59 pm')<cr>", opts)
            map("n", "<leader>t", "<cmd>g/\\[ \\]/p<cr>", { noremap = true, buffer = true })
        end
    end
})

au("Filetype", {
    pattern = { "tex", "markdown", "json" },
    callback = function()
        vim.o.spell = true
        vim.opt_local.wrap = true
        vim.opt_local.linebreak = true
        vim.opt_local.list = false
        if vim.bo.filetype == "tex" then
            map("i", "<s-cr>", "<cr>\\item[--] ", opts)
        end
    end
})

au("BufWritePre", {
    pattern = "*",
    -- command = [[ mark ` | %s/\s\+$//e | normal `` ]]
    callback = function()
        local l = vim.fn.winsaveview()
        vim.cmd[[keeppatterns %s/\s\+$//e]]
        vim.fn.winrestview(l)
    end
})

au("BufEnter", {
    pattern = "*.keymap",
    callback = function()
        vim.o.ft = "c"
    end,
})

au("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
})

au({ "BufNewFile", "BufReadPre" }, {
    pattern = { "*" },
    callback = function(ev)
        local filename = vim.api.nvim_buf_get_name(ev.buf)
        -- do not log .git files, and buffers opened by plugins (which often contain some ':')
        if not (string.find(filename, "/.git") or string.find(filename, ":")) then
            local cmd = "jumper -f ${__JUMPER_FILES} -a '" .. filename .. "'"
            os.execute(cmd)
        end
    end
})
-- vim.cmd[[
-- command! -nargs=+ Z :cd `jumper -f ${__JUMPER_FOLDERS} -n 1 '<args>'`
-- command! -nargs=+ Zf :edit `jumper -f ${__JUMPER_FILES} -n 1 '<args>'`
-- ]]
