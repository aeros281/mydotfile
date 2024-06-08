return {
    {
        "elixir-tools/elixir-tools.nvim",
        version = "*",
        event = { "BufReadPre *.ex,*.exs", "BufNewFile *.ex,*.exs" },
        config = function()
            require("elixir").setup({
                nextls = { enable = false },
                credo = { enable = true },
                elixirls = { enable = true },
            })
        end,
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
}
