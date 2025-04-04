local function map(mode, lhs, rhs)
	vim.keymap.set(mode, lhs, rhs, { silent = true })
end

vim.api.nvim_set_keymap("n", "<M-w>", ":bd<CR>", { noremap = true, silent = true })
-- Fuck macOS --
vim.api.nvim_set_keymap("n", "<∑>", ":bd<CR>", { noremap = true, silent = true })

local default_opts = {noremap = true, silent = true}
vim.api.nvim_set_keymap('v', '<C-f>', 'y<ESC>:Telescope live_grep default_text=<c-r>0<CR>', default_opts)

local builtin = require("telescope.builtin")
map("i", "<c-v>", function()
	vim.cmd("Telescope neoclip")
end)

local ranger = require("ranger-nvim")
local legendary = require("legendary")

vim.api.nvim_set_keymap("n", "<F1>", ":Legendary<CR>", { noremap = true, silent = true })
legendary.setup({
	keymaps = {
		{ "<A-w>", ":bd<CR>", description = "Close the current buffer" },
		{ "<C-p>", builtin.find_files, description = "Find files" },
		{ "<A-F>", ":Telescope egrepify<CR>", description = "Live grep" },
		{ "<C-v>", ":Telescope registers<CR>", description = "Open registers (Telescope)" },
		{ "<leader><leader>neo", ":Telescope neoclip<CR>", description = "Open neoclip (Telescope)" },
		{ ";", builtin.buffers, description = "Search buffers" },
		{ "<leader>A", builtin.grep_string, description = "Grep the current string on cursor" },
		{
			"<leader>ra",
			function()
				ranger.open(true)
			end,
			description = "Open ranger (File browser)",
		},
		{
			"<F2>",
			function()
				vim.cmd("LazyGit")
			end,
			description = "Git tool",
		},
		{
			"<F3>",
			function()
				vim.cmd('TermExec cmd="git status"')
			end,
			description = "Open git terminal",
		},
		{
			"~",
			function()
				MiniFiles.open(vim.api.nvim_buf_get_name(0))
			end,
			description = "Show mini files",
		},

		-- Git
		{ "<leader>st", builtin.git_status, description = "Git status" },
		{ "<leader>gs", ":AdvancedGitSearch<CR>", description = "Advanced git search" },
		{ "<leader>gb", ":GitBlameToggle<CR>", description = "Toggle git blame" },

		-- LSP keymap
		{ "gr", builtin.lsp_references, description = "Find all references" },
		{ "gd", builtin.lsp_definitions, description = "Go to definition" },
		{ "gi", builtin.lsp_implementations, description = "Find all implementations" },
		{ "<space>o", builtin.lsp_document_symbols, description = "Find all symbols in the current document" },
		{
			"<space>s",
			builtin.lsp_dynamic_workspace_symbols,
			description = "Find all symbols on the current workspace (Dynamic)",
		},
		{ "<space>e", builtin.diagnostics, description = "Show all diagnostics" },
		{ "<space>l", ":AerialToggle right<CR>", description = "Toggle code outline" },
		{
			"<space>f",
			function()
				vim.lsp.buf.format({ async = true })
			end,
			description = "Format current buffer",
		},

		-- Marks
		{
			"mo",
			function()
				vim.cmd("Telescope bookmarks list")
			end,
			description = "Show all marks (Telescope)",
		},
		{ "m;", "<Plug>(Marks-toggle)", description = "Toggle mark on the current line" },
		{ "dm<space>", "<Plug>(Marks-deletebuf)", description = "Clear all marks on the current buffer" },
	},
	commands = {
		{
			":LedgLazy",
			function()
				vim.cmd("Lazy")
			end,
			description = "Open Lazy config",
		},
		{
			":LedgYamlJump",
			function()
				vim.cmd("YAMLTelescope")
			end,
			description = "View YAML (Telescope)",
		},
		{
			":LedgYamlView",
			function()
				vim.cmd("YAMLView")
			end,
			description = "View YAML",
		},
		{
			":LedgDiffView",
			function()
				vim.cmd("DiffviewOpen")
			end,
			description = "Open diff view",
		},
		{
			":LedgDiffViewOff",
			function()
				vim.cmd("DiffviewClose")
			end,
			description = "Close diff view",
		},
		{
			":LedgGitHub",
			function()
				vim.cmd("GitBlameOpenFileURL")
			end,
			description = "Github/GitLab open file URL",
		},
		{
			":LedgGitHubCommitHash",
			function()
				vim.cmd("GitBlameOpenCommitURL")
			end,
			description = "Github/GitLab open commit URL",
		},
		{
			":LedgToggleInlayHints",
			function()
				require("lsp-inlayhints").toggle()
			end,
			description = "Toggle inlay hints",
		},
		{
			":SaveBookmarks",
			function()
				local actions = require("bookmarks.actions")
				actions.saveBookmarks()
			end,
			description = "Save current bookmarks",
		},
		{
			":LoadBookmarks",
			function()
				local actions = require("bookmarks.actions")
				actions.loadBookmarks()
			end,
			description = "Refresh bookmarks",
		},
		{
			":ChangeColorScheme",
			function()
				vim.cmd("Telescope colorscheme")
			end,
			description = "Change current colorscheme",
		},
	},
})
