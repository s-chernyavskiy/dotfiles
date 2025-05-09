local opts = {
	ensure_installed = {
		"efm",
		"lua_ls",
		"gopls",
	},
	automatic_installation = true,
}

return {
	"williamboman/mason-lspconfig.nvim",
	opts = opts,
    lazy = false,
	event = "BufReadPre",
	dependencies = "williamboman/mason.nvim",
}
