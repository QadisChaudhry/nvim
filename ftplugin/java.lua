local status, jdtls = pcall(require, "jdtls")
if not status then
    return
end

local workspace_dir = vim.fn.expand("~") .. "/workspace/" .. vim.fn.expand("%:p:h:t")

local config = {
    on_attach = require("lsp.handlers").on_attach,
    capabilities = require("lsp.handlers").capabilities,

    cmd = {
        'java',

        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Dlog.level=ALL',
        '-Xms1g',
        '--add-modules=ALL-SYSTEM',
        '--add-opens', 'java.base/java.util=ALL-UNNAMED',
        '--add-opens', 'java.base/java.lang=ALL-UNNAMED',

        '-jar', '/Users/qadischaudhry/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',

        '-configuration', '/Users/qadischaudhry/.local/share/nvim/mason/packages/jdtls/config_mac/',

        '-data', workspace_dir
    },

    -- root_dir = vim.fn.expand("%:p:h"),
    root_dir = vim.fs.dirname(vim.fs.find({ ".git" }, { upward = true })[1]),

    settings = {
        java = {
        }
    },

    init_options = {
        bundles = {}
    },
}

jdtls.start_or_attach(config)
