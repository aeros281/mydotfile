return {
    {
        "mrjones2014/legendary.nvim",
        priority = 10000,
        lazy = false,
        -- sqlite is only needed if you want to use frecency sorting
        dependencies = { { "kkharji/sqlite.lua" } },
        config = function()
        end,
    }
}
