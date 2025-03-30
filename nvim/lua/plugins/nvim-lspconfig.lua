local on_attach = require("util.lsp").on_attach
local signs = require("util.lsp").signs

local config = function()
	require("neoconf").setup()
	local cmp_nvim_lsp = require("cmp_nvim_lsp")
	local lspconfig = require("lspconfig")

	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
	end

	local capabilities = cmp_nvim_lsp.default_capabilities()

	lspconfig.lua_ls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					library = {
						vim.fn.expand("$VIMRUNTIME/lua"),
						vim.fn.expand("$XDG_CONFIG_HOME") .. "/nvim/lua",
					},
				},
			},
		},
	})

	lspconfig.gopls.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		cmd = { "gopls" },
		filetypes = { "go", "gomod", "gowork", "gotmpl" },
		settings = {
			gopls = {
				completeUnimported = true,
				usePlaceholders = true,
				analyses = {
					unusedparams = true,
				},
			},
		},
		single_file_support = true,
	})

	vim.g.rustaceanvim = {
		-- Plugin configuration
		tools = {},
		-- LSP configuration
		server = {
			on_attach = on_attach,
			settings = {
				-- rust-analyzer language server configuration
				["rust-analyzer"] = {
				},
			},
		},
		dap = {
        },
	}

	local luacheck = require("efmls-configs.linters.luacheck")
	local stylua = require("efmls-configs.formatters.stylua")

	local golangci_lint = require("efmls-configs.linters.golangci_lint")
	local gofumpt = require("efmls-configs.formatters.gofumpt")

    local ast_grep = {
        lintCommand = "sg lint --format json --no-ignore --quiet --pattern '${INPUT}'",
        lintStdin = true,
        lintFormats = {"%f:%l:%c: %m"},
        lintSource = "ast-grep",
        lintIgnoreExitCode = true,
    }

    local rustfmt = {
        formatCommand = "rustfmt --edition 2024 --emit stdout --quiet",
        formatStdin = true,
    }

	lspconfig.efm.setup({
		filetypes = {
			"lua",
			"go",
            "rust",
		},
		init_options = {
			documentFormatting = true,
			documentRangeFormatting = true,
			hover = true,
			documentSymbol = true,
			codeAction = true,
			completion = true,
		},
		settings = {
			languages = {
				lua = { luacheck, stylua },
				go = { golangci_lint, gofumpt },
                rust = { ast_grep, rustfmt },
			},
		},
	})

	local lsp_fmt_group = vim.api.nvim_create_augroup("LspFormattingGroup", {})
	vim.api.nvim_create_autocmd("BufWritePost", {
		group = lsp_fmt_group,
		callback = function()
			local efm = vim.lsp.get_clients({ name = "efm" })

			if vim.tbl_isempty(efm) then
				return
			end

			vim.lsp.buf.format({ name = "efm" })
		end,
	})
end

return {
	"neovim/nvim-lspconfig",
	opts = {
		inlay_hint = { enable = true},
	},
	config = config,
	lazy = false,
	dependencies = {
		"windwp/nvim-autopairs",
		"williamboman/mason.nvim",
		"creativenull/efmls-configs-nvim",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp",
	},
}
