-- === setup NeoVim === 
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.cmd("set relativenumber")
vim.cmd("set noshowmode")

-- mapleader
vim.g.mapleader = " "

-- === LazyNvim ===
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
local opts = {}

require("lazy").setup("plugins")

-- === Plugins Setup ===
-- Treesitter
local config = require("nvim-treesitter.configs")
config.setup({
  ensure_installed = {
    "lua",
    "python",
    "vim",
    "javascript"
  },
  auto_install = true,
  highlight = {enable = true},
  indent = {enable = true},
})


-- === Keymaps ===
vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal right<CR>", {})
