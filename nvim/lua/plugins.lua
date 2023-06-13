-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- File utilities
    use {
        "ms-jpq/chadtree",
        branch = 'chad',
        run = 'python3 -m chadtree deps'
    }

    -- UI utilities
    use {'stevearc/dressing.nvim'}

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true },
        config = function() require'lualine'.setup() end,
    }

    use({
        "utilyre/barbecue.nvim",
        tag = "*",
        requires = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("barbecue").setup()
        end,
    })

    use {
        "petertriho/nvim-scrollbar",
        config = function()
            require("scrollbar").setup()
        end
    }

    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
            require('scrollbar.handlers.gitsigns').setup()
        end
    }

    use {
        'chentoast/marks.nvim',
        config = function()
            require('anhtran.marks')
        end
    }

    use "numToStr/FTerm.nvim"

    use 'nvim-tree/nvim-web-devicons'

    use {
        'gelguy/wilder.nvim',
        config = function()
            local wilder = require('wilder')
            wilder.setup({modes = {':', '/', '?'}})
            wilder.set_option('renderer', wilder.renderer_mux({
                [':'] = wilder.popupmenu_renderer(
                    wilder.popupmenu_border_theme({
                        highlights = {
                            border = 'Normal', -- highlight to use for the border
                        },
                        -- 'single', 'double', 'rounded' or 'solid'
                        -- can also be a list of 8 characters, see :h wilder#popupmenu_border_theme() for more details
                        border = 'rounded',
                    })
                ),
                ['/'] = wilder.wildmenu_renderer({
                    highlighter = wilder.basic_highlighter(),
                }),
            }))
        end,
    }

    -- Search utilities
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
        requires = { {'nvim-lua/plenary.nvim'} },
        config = function()
            require('anhtran.telescope')
        end,
    }
    
    use {
        'phaazon/hop.nvim',
        branch = 'v2', -- optional but strongly recommended
        config = function()
            require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
        end
    }

    use {
        'kelly-lin/ranger.nvim'
    }

    use {
        'AckslD/nvim-neoclip.lua',
        requires = {
            {'nvim-telescope/telescope.nvim'},
        },
        config = function()
            require('anhtran.neo_clip')
        end,
    }

    use {
        'aaronhallaert/advanced-git-search.nvim',
        config = function()
            require('anhtran.advanced_git_search')
        end,
        requires = {
            'nvim-telescope/telescope.nvim',
            -- to show diff splits and open commits in browser
            'tpope/vim-fugitive',
            -- to open commits in browser with fugitive
            'tpope/vim-rhubarb',
            -- optional: to replace the diff from fugitive with diffview.nvim
            'sindrets/diffview.nvim',
        },
    }

    use {
        'mrjones2014/legendary.nvim',
        tag = 'v2.1.0',
        -- sqlite is only needed if you want to use frecency sorting
        requires = { {'kkharji/sqlite.lua'} },
        config = function()
            require('anhtran.legendary')
        end
    }

    use 'f-person/git-blame.nvim'

    -- Editing
    use {
        'm4xshen/autoclose.nvim',
        config = function()
            require('autoclose').setup()
        end
    }

    use({
        'kylechui/nvim-surround',
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require('nvim-surround').setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    })

    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    use {
        "tenxsoydev/tabs-vs-spaces.nvim",
        config = function()
            require("tabs-vs-spaces").setup()
        end
    }

    use {
        'stevearc/aerial.nvim',
        config = function() require('aerial').setup() end
    }

    -- Code completion
    use {
        'neovim/nvim-lspconfig',
        config = function()
            require'anhtran.lsp_config'
        end
    }

    use {
        'ms-jpq/coq_nvim'
    }

    use {
        'ms-jpq/coq.thirdparty'
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    
    use 'Glench/Vim-Jinja2-Syntax'

    use {
        "cuducos/yaml.nvim",
        ft = { "yaml" }, -- optional
        requires = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-telescope/telescope.nvim" -- optional
        },
    }

    use {
        'tanvirtin/vgit.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        },
        config = function()
            require('vgit').setup()
        end
    }

    -- Colorschemes
    use {
        'dasupradyumna/midnight.nvim',
        requires = { 'nvim-treesitter/nvim-treesitter', opt = true },
        config = function()
            vim.cmd('colorscheme midnight')
        end
    }
end)
