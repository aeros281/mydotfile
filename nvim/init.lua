-- vim.opt.clipboard = 'unnamedplus'
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.title = true

vim.opt.number = true
vim.opt.mouse = "a"
vim.opt.cursorline = true
vim.opt.ttimeoutlen = 50

vim.opt.termguicolors = true
vim.g.coq_settings = { auto_start = "shut-up" }
vim.g.gitblame_enabled = 0

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

require("plugins")
require("mappings")

vim.opt.termguicolors = true
vim.opt.signcolumn = "auto"

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = opts.border or 'single'
    if opts.width == nil then
        opts.width = 80
    end
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

vim.cmd("colorscheme tokyonight")
