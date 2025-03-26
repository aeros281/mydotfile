return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("anhtran.lsp_config")
        end,
    },
    {
        "ms-jpq/coq_nvim",
        "ms-jpq/coq.artifacts",
    },
    {
        "lvimuser/lsp-inlayhints.nvim",
        config = function()
            require("lsp-inlayhints").setup()
        end,
        enabled = false,
    },

    {
        "ms-jpq/coq.thirdparty",
    },

    {
        "nvim-treesitter/nvim-treesitter",
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = "nvim-treesitter/nvim-treesitter",
    },
    {
        "cuducos/yaml.nvim",
        ft = { "yaml" }, -- optional
        requires = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-telescope/telescope.nvim", -- optional
        },
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
            require("anhtran.null-ls-config")
        end,
    },
}
