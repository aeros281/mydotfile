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
        config = function()
            vim.g.lazygit_floating_window_winblend = 0 -- transparency of floating window
            vim.g.lazygit_floating_window_scaling_factor = 0.9 -- scaling factor for floating window
            vim.g.lazygit_floating_window_border_chars = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" } -- customize lazygit popup window border characters
            vim.g.lazygit_floating_window_use_plenary = 1 -- use plenary.nvim to manage floating window if available
            vim.g.lazygit_use_neovim_remote = 1 -- fallback to 0 if neovim-remote is not installed

            vim.g.lazygit_use_custom_config_file_path = 0 -- config file path is evaluated if this value is 1
            vim.g.lazygit_config_file_path = "" -- custom config file path
            -- OR
            -- vim.g.lazygit_config_file_path = {} -- table of custom config file paths
        end,
    },
}
