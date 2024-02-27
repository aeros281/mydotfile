local egrep_actions = require("telescope._extensions.egrepify.actions")

require("telescope").setup({
    defaults = {
        layout_strategy = "vertical",
        -- Default configuration for telescope goes here:
        -- config_key = value,
        mappings = {
            i = {
                -- map actions.which_key to <C-h> (default: <C-/>)
                -- actions.which_key shows the mappings for your picker,
                -- e.g. git_{create, delete, ...}_branch for the git_branches picker
            },
        },
    },
    pickers = {
        -- Default configuration for builtin pickers goes here:
        -- picker_name = {
        --   picker_config_key = value,
        --   ...
        -- }
        -- Now the picker_config_key will be applied every time you call this
        -- builtin picker
    },
    extensions = {
        -- Your extension configuration goes here:
        -- extension_name = {
        --   extension_config_key = value,
        -- }
        -- please take a look at the readme of the extension you want to configure
        advanced_git_search = {
            -- Fugitive or diffview
            diff_plugin = "fugitive",
            -- Customize git in previewer
            -- e.g. flags such as { "--no-pager" }, or { "-c", "delta.side-by-side=false" }
            git_flags = {},
            -- Customize git diff in previewer
            -- e.g. flags such as { "--raw" }
            git_diff_flags = {},
            -- Show builtin git pickers when executing "show_custom_functions" or :AdvancedGitSearch
            show_builtin_git_pickers = false,
        },
        egrepify = {
            -- intersect tokens in prompt ala "str1.*str2" that ONLY matches
            -- if str1 and str2 are consecutively in line with anything in between (wildcard)
            AND = true,          -- default
            permutations = false, -- opt-in to imply AND & match all permutations of prompt tokens
            lnum = true,         -- default, not required
            lnum_hl = "EgrepifyLnum", -- default, not required, links to `Constant`
            col = false,         -- default, not required
            col_hl = "EgrepifyCol", -- default, not required, links to `Constant`
            title = true,        -- default, not required, show filename as title rather than inline
            filename_hl = "EgrepifyFile", -- default, not required, links to `Title`
            -- suffix = long line, see screenshot
            -- EXAMPLE ON HOW TO ADD PREFIX!
            prefixes = {
                -- ADDED ! to invert matches
                -- example prompt: ! sorter
                -- matches all lines that do not comprise sorter
                -- rg --invert-match -- sorter
                ["!"] = {
                    flag = "invert-match",
                },
                -- HOW TO OPT OUT OF PREFIX
                -- ^ is not a default prefix and safe example
                ["^"] = false,
            },
            -- default mappings
            mappings = {
                i = {
                    -- toggle prefixes, prefixes is default
                    ["<C-z>"] = egrep_actions.toggle_prefixes,
                    -- toggle AND, AND is default, AND matches tokens and any chars in between
                    ["<C-a>"] = egrep_actions.toggle_and,
                    -- toggle permutations, permutations of tokens is opt-in
                    ["<C-r>"] = egrep_actions.toggle_permutations,
                },
            },
        },
    },
})
require("telescope").load_extension("egrepify")
