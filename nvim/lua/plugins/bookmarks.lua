return {
    {
        "tomasky/bookmarks.nvim",
        dependencies = "telescope.nvim",
        event = "VimEnter",
        config = function()
            require("bookmarks").setup({
                sign_priority = 99, --set bookmark sign priority to cover other sign
                save_file = vim.fn.expand("$HOME/.bookmarks"), -- bookmarks save file path
                keywords = {
                    ["test:"] = "󰙨", -- mark annotation startswith @t ,signs this icon as `Todo`
                    ["main:"] = "", -- mark annotation startswith @w ,signs this icon as `Warn`
                    ["fix:"] = "⛏ ", -- mark annotation startswith @f ,signs this icon as `Fix`
                    ["note:"] = "󰎚", -- mark annotation startswith @n ,signs this icon as `Note`
                },
                on_attach = function(bufnr)
                    local bm = require("bookmarks")
                    local map = vim.keymap.set
                    map("n", "mm", bm.bookmark_toggle) -- add or remove bookmark at current line
                    map("n", "mi", bm.bookmark_ann) -- add or edit mark annotation at current line
                    map("n", "mc", bm.bookmark_clean) -- clean all marks in local buffer
                    map("n", "mn", bm.bookmark_next) -- jump to next mark in local buffer
                    map("n", "mp", bm.bookmark_prev) -- jump to previous mark in local buffer
                    map("n", "ml", bm.bookmark_list) -- show marked file list in quickfix window
                end,
            })
            require("telescope").load_extension("bookmarks")
        end,
    },
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local harpoon = require("harpoon")

            -- REQUIRED
            harpoon:setup()
            -- REQUIRED

            vim.keymap.set("n", "<leader>ha", function()
                harpoon:list():append()
            end)
            vim.keymap.set("n", "<leader>hl", function()
                harpoon.ui:toggle_quick_menu(harpoon:list())
            end)

            -- Toggle previous & next buffers stored within Harpoon list
            vim.keymap.set("n", "<C-M-k>", function()
                harpoon:list():prev()
            end)
            vim.keymap.set("n", "<C-M-j>", function()
                harpoon:list():next()
            end)
        end,
    },
}
