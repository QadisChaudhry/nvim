local au = vim.api.nvim_create_autocmd
local map = vim.keymap.set
local opts = { noremap = true, silent = true, buffer = true }

local buflisted = vim.fn.buflisted
local buffers = vim.fn.getbufinfo({buflisted = 1})
local listed_buffers = vim.tbl_filter(function(buf) return buflisted(buf.bufnr) end, buffers)

au("FileType", {
    pattern = "*",
    callback = function()
        if vim.bo.filetype ~= "tex" and vim.bo.filetype ~= "markdown" and vim.bo.filetype ~= "json" then
            vim.opt_local.textwidth = 120
            vim.opt_local.fo:append("t")
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
        map({ "n", "v" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, buffer = true })
        map({ "n", "v" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, buffer = true })
        map({ "n", "v" }, "<DOWN>", "v:count == 0 ? 'gj' : 'j'", { expr = true, buffer = true })
        map({ "n", "v" }, "<UP>", "v:count == 0 ? 'gk' : 'k'", { expr = true, buffer = true })
        if vim.bo.filetype == "tex" then
            map("i", "<s-cr>", "<cr>\\item[--] ", opts)
        end
        if vim.bo.filetype == "markdown" and vim.api.nvim_win_get_config(0).relative ~= '' then
            map("n", "<esc>", ":bdelete!<cr>", { silent = true, buffer = true })
        end
    end
})

au("Filetype", {
    pattern = "alpha",
    callback = function()
        vim.wo.fillchars = "eob: "
        if #listed_buffers > 0 then
            map("n", "<esc>", ":bdelete!<cr>", { silent = true, buffer = true })
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

au("BufEnter", {
    pattern = "*.keymap",
    callback = function()
        vim.o.ft = "c"
    end,
})

au("BufWritePre", {
    pattern = "*",
    callback = function()
        local l = vim.fn.winsaveview()
        vim.cmd[[keeppatterns %s/\s\+$//e]]
        vim.fn.winrestview(l)
    end
})

au("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- Jumper
au({ "BufNewFile", "BufReadPre" }, {
    pattern = { "*" },
    callback = function(ev)
        local filename = vim.api.nvim_buf_get_name(ev.buf)
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
