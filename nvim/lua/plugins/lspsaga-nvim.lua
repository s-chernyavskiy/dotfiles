return {
	"nvimdev/lspsaga.nvim",
	lazy = false,
	config = function()
		require("lspsaga").setup({
			-- keybinds for navigation in lspsaga window
			move_in_saga = { prev = "<C-k>", next = "<C-j>" },
			-- use enter to open file with finder
			finder_action_keys = {
				open = "<CR>",
			},
			-- use enter to open file with definition preview
			definition_action_keys = {
				edit = "<CR>",
			},

			lightbulb = {
				enable = true,
				sign = true,
				sign_priority = 40,
				virtual_text = false,
			},

			symbol_in_winbar = {
				enable = true,
				separator = " › ",
				hide_keyword = false,
				ignore_patterns = nil,
				show_file = true,
				folder_level = 1,
				color_mode = true,
				delay = 300,
			},

			implement = {
				enable = false,
				sign = true,
				lang = {},
				virtual_text = true,
				priority = 100,
			},

			beacon = {
				enable = true,
				frequency = 7,
			},

			ui = {
				winbar_prefix = "",
				border = "rounded",
				devicon = true,
				foldericon = true,
				title = true,
				expand = "⊞",
				collapse = "⊟",
				code_action = "💡",
				lines = { "┗", "┣", "┃", "━", "┏" },
				kind = nil,
				button = { "", "" },
				imp_sign = "󰳛 ",
				use_nerd = true,
			},
		})
	end,
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
}
