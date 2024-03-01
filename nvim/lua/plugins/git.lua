return {
    "f-person/git-blame.nvim",
    {
        "aaronhallaert/advanced-git-search.nvim",
        config = function()
            require("anhtran.advanced_git_search")
        end,
        enabled = false,
        dependencies = {
            "nvim-telescope/telescope.nvim",
            -- to show diff splits and open commits in browser
            "tpope/vim-fugitive",
            -- to open commits in browser with fugitive
            "tpope/vim-rhubarb",
            -- optional: to replace the diff from fugitive with diffview.nvim
            "sindrets/diffview.nvim",
        },
    },
    "sindrets/diffview.nvim",
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()
            require("scrollbar.handlers.gitsigns").setup()
        end,
    },
    {
        "kdheepak/lazygit.nvim",
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
}
