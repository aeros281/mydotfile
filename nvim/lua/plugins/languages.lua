return {
    {
        "elixir-tools/elixir-tools.nvim",
        version = "*",
        event = { "BufReadPre *.ex,*.exs", "BufNewFile *.ex,*.exs" },
        config = function()
            require("elixir").setup({})
        end,
        enabled = true,
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
}
