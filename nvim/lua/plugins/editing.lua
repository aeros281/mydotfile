return {
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},
	{
		"tenxsoydev/tabs-vs-spaces.nvim",
		config = function()
			require("tabs-vs-spaces").setup()
		end,
	},
	{
		"stevearc/aerial.nvim",
		config = function()
			require("aerial").setup()
		end,
	},
	{
		"altermo/ultimate-autopair.nvim",
		enabled = false,
		event = { "InsertEnter", "CmdlineEnter" },
		branch = "v0.6", --recomended as each new version will have breaking changes
		opts = {
			--Config goes here
		},
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {}, -- this is equalent to setup({}) function
		config = function()
			require("anhtran.auto_pair")
		end,
	},
	{
		"RRethy/vim-illuminate",
		enabled = true,
		config = function()
			-- default configuration
			require("illuminate").configure({
				-- providers: provider used to get references in the buffer, ordered by priority
				providers = {
					"lsp",
					"treesitter",
					"regex",
				},
				-- delay: delay in milliseconds
				delay = 100,
				-- filetypes_denylist: filetypes to not illuminate, this overrides filetypes_allowlist
				filetypes_denylist = {
					"dirbuf",
					"dirvish",
					"fugitive",
				},
				under_cursor = true,
				large_file_cutoff = nil,
				-- large_file_config: config to use for large files (based on large_file_cutoff).
				-- Supports the same keys passed to .configure
				-- If nil, vim-illuminate will be disabled for large files.
				large_file_overrides = nil,
				-- min_count_to_highlight: minimum number of matches required to perform highlighting
				min_count_to_highlight = 1,
				-- should_enable: a callback that overrides all other settings to
				-- enable/disable illumination. This will be called a lot so don't do
				-- anything expensive in it.
				should_enable = function(bufnr)
					return true
				end,
				case_insensitive_regex = false,
			})
		end,
	},
	{
		"yamatsum/nvim-cursorline",
		enabled = false,
		config = function()
			require("nvim-cursorline").setup({
				cursorline = {
					enable = true,
					timeout = 1000,
					number = false,
				},
				cursorword = {
					enable = true,
					min_length = 3,
					hl = { underline = true },
				},
			})
		end,
	},
	{
		"nvim-pack/nvim-spectre",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		keys = {
			{
				"<leader>S",
				function()
					require("spectre").toggle()
				end,
				desc = "Toggle Spectre",
			},
			{
				"<leader>sw",
				function()
					require("spectre").open_visual({ select_word = true })
				end,
				mode = "n",
				desc = "Search current word",
			},
			{
				"<leader>sw",
				function()
					-- For visual mode, Spectre's open_visual() typically works on the selection.
					-- The <esc> is to exit visual mode before running the command if that's the desired workflow from the original mapping.
					-- However, often for visual mappings, you want to operate directly on the selection.
					-- If Spectre handles visual selection directly with open_visual(), the <esc> might be redundant
					-- or even counterproductive. Test this behavior.
					-- For a direct visual search without exiting visual mode first (if spectre supports it well):
					-- require("spectre").open_visual()
					-- If you need the <esc> behavior from vimscript:
					vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<esc>", true, false, true), "nx", false)
					require("spectre").open_visual()
				end,
				mode = "v",
				desc = "Search current selection",
			},
			{
				"<leader>sp",
				function()
					require("spectre").open_file_search({ select_word = true })
				end,
				mode = "n",
				desc = "Search on current file",
			},
		},
	},
}
