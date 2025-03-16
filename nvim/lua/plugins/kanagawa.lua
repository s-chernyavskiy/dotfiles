return {
	"rebelot/kanagawa.nvim",
	-- lazy = false,
	-- priority = 1000,
	config = function()
		local kanagawa = require("kanagawa")
		local flavor = "dragon"

		kanagawa.setup({
			compile = false, -- enable compiling the colorscheme
			undercurl = true, -- enable undercurls
			commentStyle = { italic = true },
			functionStyle = {},
			keywordStyle = { italic = true },
			statementStyle = { bold = true },
			typeStyle = {},
			transparent = true, -- do not set background color
			dimInactive = false, -- dim inactive window `:h hl-NormalNC`
			terminalColors = true, -- define vim.g.terminal_color_{0,17}
			colors = { -- add/modify theme and palette colors
				palette = {},
				theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
			},
			overrides = function(colors) -- add/modify highlights
				return {}
			end,
			theme = "dragon", -- Load "wave" theme when 'background' option is not set
		})

		kanagawa.load(flavor)
	end,
}
