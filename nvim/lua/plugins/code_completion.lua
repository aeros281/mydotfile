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
    },

    {
        "ms-jpq/coq.thirdparty",
    },

    {
        "nvim-treesitter/nvim-treesitter",
        commit = "f2778bd1a28b74adf5b1aa51aa57da85adfa3d16",
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        commit = "35a60f093fa15a303874975f963428a5cd24e4a0",
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
