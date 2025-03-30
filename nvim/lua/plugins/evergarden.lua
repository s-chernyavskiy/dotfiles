return {
	"comfysage/evergarden",
	priority = 1000,
	lazy = false,
	config = function()
		require("evergarden").setup({
			theme = {
				variant = "winter",
			},
			style = {
				comment = { "italic" },
			},
			overrides = {},
		})
		vim.cmd.colorscheme("evergarden")
	end,
}
