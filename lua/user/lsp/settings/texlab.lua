return {
    root_dir = function ()
        vim.cmd("silent! lcd %:p:h")
        return vim.fn.getcwd()
    end
}
