local function map(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, { silent = true })
end

map('n', '<C-T>', function() vim.cmd("CHADopen") end)

local builtin = require('telescope.builtin')
map('i', '<c-v>', function() vim.cmd("Telescope neoclip") end)

local hop = require('hop')
map('n', '<leader><leader>s', function() vim.cmd("HopWord") end)

local ranger = require('ranger-nvim')
local legendary = require('legendary')

legendary.setup({
    keymaps = {
        { '<F1>', ':Legendary<CR>', description = 'Legendary search' },
        { '<A-w>', ':bd<CR>', description = 'Close the current buffer' },
        { '<C-p>', builtin.find_files, description = 'Find files' },
        { '<A-F>', builtin.live_grep, description = 'Live grep' },
        { '<C-v>', ':Telescope registers<CR>', description = 'Open registers (Telescope)' },
        { '<leader><leader>neo', ':Telescope neoclip<CR>', description = 'Open neoclip (Telescope)' },
        { ';', builtin.buffers, description = 'Search buffers' },
        { '<leader>A', builtin.grep_string, description = 'Grep the current string on cursor' },
        { '<leader>ra', function() ranger.open(true) end, description = 'Open ranger (File browser)' },
        { '<C-`>', function() require('Fterm').toggle() end, description = 'Open quake terminal' },

        -- Git
        { '<leader>st', builtin.git_status, description = 'Git status' },
        { '<leader>gs', ':AdvancedGitSearch<CR>', description = 'Advanced git search' },
        { '<leader>gb', ':GitBlameToggle<CR>', description = 'Toggle git blame' },
        { '<leader>gh', ':VGit buffer_hunk_preview<CR>', description = 'VGit: Buffer hunk preview related to current cursor' },
        { '<leader>gd', ':VGit buffer_diff_preview<CR>', description = 'VGit: Buffer diff preview' },
        { '<leader>gp', ':VGit project_diff_preview<CR>', description = 'VGit: Project diff preview' },

        -- LSP keymap
        { 'gr', builtin.lsp_references, description = 'Find all references' },
        { 'gd', builtin.lsp_definitions, description = 'Go to definition' },
        { 'gi', builtin.lsp_implementations, description = 'Find all implementations' },
        { '<space>o', builtin.lsp_document_symbols, description = 'Find all symbols in the current document' },
        { '<space>s', builtin.lsp_dynamic_workspace_symbols, description = 'Find all symbols on the current workspace (Dynamic)' },
        { '<space>e', builtin.diagnostics, description = 'Show all diagnostics' },
        { '<space>l', ':AerialToggle right<CR>', description = 'Toggle code outline' },

        -- Marks
        { 'mo', builtin.marks, description = 'Show all marks (Telescope)' },
        { 'm;', '<Plug>(Marks-toggle)', description = 'Toggle mark on the current line' },
        { 'dm<space>', '<Plug>(Marks-deletebuf)', description = 'Clear all marks on the current buffer' },
    },
    commands = {
        {
            ':LedgPackerSync',
            function()
                vim.cmd("PackerSync")
            end,
            description = "Sync packer",
        },
        {
            ':LedgYamlJump',
            function()
                vim.cmd("YAMLTelescope")
            end,
            description = "View YAML (Telescope)",
        },
        {
            ':LedgYamlView',
            function()
                vim.cmd("YAMLView")
            end,
            description = "View YAML",
        },
        {
            ':LedgDiffView',
            function()
                vim.cmd("DiffviewOpen")
            end,
            description = "Open diff view",
        },
        {
            ':LedgDiffViewOff',
            function()
                vim.cmd("DiffviewClose")
            end,
            description = "Close diff view",
        },
    }
})
