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
        if vim.bo.filetype == "tex" then
            map("i", "<s-cr>", "<cr>\\item[--] ", opts)
        end
        if vim.bo.filetype == "markdown" and vim.api.nvim_win_get_config(0).relative ~= '' then
            vim.keymap.set("n", "<esc>", ":bdelete!<cr>", { silent = true, buffer = true })
        end
    end
})

au("Filetype", {
    pattern = { "oil", "alpha"},
    callback = function()
        vim.wo.fillchars = "eob: "
        if vim.bo.filetype == "oil" then
            vim.wo.nu = false
            vim.wo.rnu = false
            if #listed_buffers > 0 then
                vim.keymap.set("n", "<esc>", ":q!<cr>", { silent = true, buffer = true })
            end
        elseif #listed_buffers > 0 then
            vim.keymap.set("n", "<esc>", ":bdelete!<cr>", { silent = true, buffer = true })
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
    -- command = [[ mark ` | %s/\s\+$//e | normal `` ]]
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
