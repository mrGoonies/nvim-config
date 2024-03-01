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

local plugins = {
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {
    "nvim-treesitter/nvim-treesitter",
    name = "nvim-treesitter",
    build = ":TSUpdate"
  },
  -- IDE Settings
}

local opts = {}

require("lazy").setup(plugins, opts)

-- === Plugins Setup ===
require("catppuccin").setup({
  vim.cmd.colorscheme "catppuccin-frappe"
})

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

