local status1, mason = pcall(require, "mason")
if not status1 then
    return
end
local status2, masonlsp = pcall(require, "mason-lspconfig")
if not status2 then
    return
end
local status3, lsp = pcall(require, "lspconfig")
if not status3 then
    return
end

mason.setup({ ui = { border = "rounded" } })
-- mason.setup()
masonlsp.setup()

require("user.lsp.handlers").setup()

local servers = {
    "sumneko_lua",
    "pyright",
    "texlab",
}

for _, server in pairs(servers) do
    local opts = {
        on_attach = require("user.lsp.handlers").on_attach,
        capabilities = require("user.lsp.handlers").capabilities,
    }

    local server_opts = require(string.format("user.lsp.settings.%s", server))
    opts = vim.tbl_deep_extend("force", server_opts, opts)

    lsp[string.format('%s', server)].setup(opts)
end

-- vim.cmd([[
--     augroup jdtls_lsp
--         autocmd!
--         autocmd FileType java lua require('user.lsp.jdtls')
--     augroup end
-- ]])
