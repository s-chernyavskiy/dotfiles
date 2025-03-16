return {
	"neanias/everforest-nvim",
	-- lazy = false,
	-- priority = 999,
	config = function()
		local everforest = require("everforest")
		everforest.setup({
			background = "soft",
			transparent_background_level = 1,
			disable_italic_comments = false,
		})
		everforest.load()
	end,
}

