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
masonlsp.setup()

require("lsp.handlers").setup()

local servers = {
    "sumneko_lua",
    "pyright",
    "texlab",
    -- "ltex",
    "clangd",
    "tsserver",
}

local path = vim.fn.stdpath("config") .. "/lua/lsp"

for _, server in pairs(servers) do
    local opts = {
        on_attach = require("lsp.handlers").on_attach,
        capabilities = require("lsp.handlers").capabilities,
    }

    if io.open(string.format("%s/settings/%s.lua", path, server), "r") ~= nil then
        local server_opts = require(string.format("lsp.settings.%s", server))
        opts = vim.tbl_deep_extend("force", server_opts, opts)
    end

    lsp[string.format("%s", server)].setup(opts)
end

require("lspconfig.ui.windows").default_options.border = "rounded"

-- vim.cmd([[
--     augroup jdtls_lsp
--         autocmd!
--         autocmd FileType java lua require('lsp.jdtls')
--     augroup end
-- ]])
