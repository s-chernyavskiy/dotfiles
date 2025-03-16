return {
	"xiyaowong/transparent.nvim",
	lazy = false,
	config = function()
		vim.cmd([[hi statusline ctermbg=0 cterm=none]])
		vim.cmd([[hi ColorColumn ctermbg=0 cterm=none guibg=#33373d]])
		require("transparent").setup({
			groups = { -- table: default groups
				"Normal",
				"NormalNC",
				"Comment",
				"Constant",
				"Special",
				"Identifier",
				"Statement",
				"PreProc",
				"Type",
				"Underlined",
				"Todo",
				"String",
				"Function",
				"Conditional",
				"Repeat",
				"Operator",
				"Structure",
				"LineNr",
				"NonText",
				"SignColumn",
				"CursorLineNr",
				"EndOfBuffer",
				"InsertEnter",
			},
			extra_groups = {
				"CursorLine",
				"NormalFloat",
				"TablineFill",
			}, -- table: additional groups that should be cleared
			exclude_groups = {}, -- table: groups you don't want to clear
		})
	end,
}
