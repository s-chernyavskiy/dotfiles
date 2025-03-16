local config = function()
    require("nvim-treesitter.configs").setup({
        indent = {
            enable = true,
        },

        ensure_installed = {
            "markdown",
            "json",
            "bash",
            "lua",
            "dockerfile",
            "python",
            "gitignore",
            "go",
        },

        auto_install = true,

        highlight = {
            enable = true,
            additional_vim_regex_highlightning = true,
        },
    })
end

return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    config = config,
}

