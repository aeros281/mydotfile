return {
    {
        "elixir-tools/elixir-tools.nvim",
        version = "*",
        event = { "BufReadPre *.ex,*.exs", "BufNewFile *.ex,*.exs" },
        config = function()
            require("elixir").setup({
                credo = { enable = true },
                nextls = { enable = true },
                elixirls = { enable = false }
            })
            })
        end,
q        enabled = true,
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
}
