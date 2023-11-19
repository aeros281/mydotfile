return {
    {
        "ms-jpq/chadtree",
        branch = "chad",
        run = "python3 -m chadtree deps",
    },
    {
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup()
        end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("ibl").setup()
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
        config = function()
            require("lualine").setup()
        end,
    },

    {
        "utilyre/barbecue.nvim",
        dependencies = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("barbecue").setup()
        end,
    },

    {
        "akinsho/bufferline.nvim",
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function()
            vim.opt.termguicolors = true
            require("bufferline").setup({})
        end,
    },
    {
        "petertriho/nvim-scrollbar",
        config = function()
            require("scrollbar").setup()
        end,
    },

    {
        "chentoast/marks.nvim",
        config = function()
            require("anhtran.marks")
        end,
    },
    "numToStr/FTerm.nvim",
    "nvim-tree/nvim-web-devicons",
}
