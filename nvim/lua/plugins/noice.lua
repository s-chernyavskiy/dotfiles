return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {},
	presets = {
		bottom_search = true, -- use a classic bottom cmdline for search
		-- command_palette = true, -- position the cmdline and popupmenu together
		long_message_to_split = true, -- long messages will be sent to a split
		inc_rename = false, -- enables an input dialog for inc-rename.nvim
		lsp_doc_border = false, -- add a border to hover docs and signature help
	},
	dependencies = {
		"MunifTanjim/nui.nvim",
		{
			"rcarriga/nvim-notify",
			config = function()
				require("notify").setup({
					background_colour = "#000000",
					render = "minimal",
					timeout = 1,
                    level = "error"
				})
			end,
		},
	},
}
