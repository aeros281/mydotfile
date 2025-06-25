return {
    {
        "elixir-tools/elixir-tools.nvim",
        version = "*",
        event = { "BufReadPre *.ex,*.exs", "BufNewFile *.ex,*.exs" },
        config = function()
            require("elixir").setup({
                credo = { enable = false },
                nextls = { enable = false },
                elixirls = { enable = true }
            })
        end,
        enabled = false,
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
}
