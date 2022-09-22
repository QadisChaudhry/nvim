return {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim", "hs", "xplr", "version" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
    },
}
