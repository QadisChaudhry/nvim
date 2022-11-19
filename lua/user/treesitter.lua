local status, treesitter_configs = pcall(require, "nvim-treesitter.configs")
if not status then
    return
end

treesitter_configs.setup {
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
    }
}
