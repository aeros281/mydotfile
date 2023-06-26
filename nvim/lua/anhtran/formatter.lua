-- Utilities for creating configurations
local util = require "formatter.util"

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup {
    filetype = {
        lua = {
            require("formatter.filetypes.lua").stylua,

            function()
                if util.get_current_buffer_file_name() == "special.lua" then
                    return nil
                end

                return {
                    exe = "stylua",
                    args = {
                    "--search-parent-directories",
                    "--stdin-filepath",
                    util.escape_path(util.get_current_buffer_file_path()),
                    "--",
                    "-",
                    },
                    stdin = true,
                }
            end
        },
        python = {
            require("formatter.filetypes.python").black,
            require("formatter.filetypes.python").isort,
        },
        ["*"] = {
            require("formatter.filetypes.any").remove_trailing_whitespace
        }
    }
}
