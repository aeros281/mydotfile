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
		enabled = false,
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local harpoon = require("harpoon")

			-- REQUIRED
			harpoon:setup()
			-- REQUIRED

			vim.keymap.set("n", "<leader>ha", function()
				harpoon:list():add()
			end)
			vim.keymap.set("n", "<leader>hq", function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end)

			vim.keymap.set("n", "<leader>h1", function()
				harpoon:list():select(1)
			end)
			vim.keymap.set("n", "<leader>h2", function()
				harpoon:list():select(2)
			end)
			vim.keymap.set("n", "<leader>h3", function()
				harpoon:list():select(3)
			end)
			vim.keymap.set("n", "<leader>h4", function()
				harpoon:list():select(4)
			end)
			vim.keymap.set("n", "<leader>h5", function()
				harpoon:list():select(5)
			end)
			vim.keymap.set("n", "<leader>h6", function()
				harpoon:list():select(6)
			end)
			vim.keymap.set("n", "<leader>h7", function()
				harpoon:list():select(7)
			end)

			vim.keymap.set("n", "<space>ha", function()
				harpoon:list():add()
			end)
			vim.keymap.set("n", "<space>hq", function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end)

			vim.keymap.set("n", "<space>h1", function()
				harpoon:list():select(1)
			end)
			vim.keymap.set("n", "<space>h2", function()
				harpoon:list():select(2)
			end)
			vim.keymap.set("n", "<space>h3", function()
				harpoon:list():select(3)
			end)
			vim.keymap.set("n", "<space>h4", function()
				harpoon:list():select(4)
			end)
			vim.keymap.set("n", "<space>h5", function()
				harpoon:list():select(5)
			end)
			vim.keymap.set("n", "<space>h6", function()
				harpoon:list():select(6)
			end)
			vim.keymap.set("n", "<space>h7", function()
				harpoon:list():select(7)
			end)

			-- Toggle previous & next buffers stored within Harpoon list
			vim.keymap.set("n", "<C-M-k>", function()
				harpoon:list():prev()
			end)
			vim.keymap.set("n", "<C-M-j>", function()
				harpoon:list():next()
			end)

			-- Fuck macOS --
			vim.keymap.set("n", "<C-˚>", function()
				harpoon:list():prev()
			end)
			vim.keymap.set("n", "<C-∆>", function()
				harpoon:list():next()
			end)
		end,
	},
	{
		"otavioschwanck/arrow.nvim",
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
			-- or if using `mini.icons`
			-- { "echasnovski/mini.icons" },
		},
		opts = {
			show_icons = true,
			leader_key = ",", -- Recommended to be a single key
			buffer_leader_key = "m", -- Per Buffer Mappings
		},
	},
}
