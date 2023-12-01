return {
    {
        "MunifTanjim/prettier.nvim",
        config = function()
            require("anhtran.prettier")
        end,
    },
    {
        "mhartington/formatter.nvim",
        config = function()
            require("anhtran.formatter")
        end,
    }
}
