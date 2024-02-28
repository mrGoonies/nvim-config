-- === setup NeoVim === 
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.cmd("set relativenumber")

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
  {
    "neanias/everforest-nvim",
    name = "everforest", 
    version = false, 
    lazy = false, 
    priority = 1000
  },
  {
    "nvim-treesitter/nvim-treesitter",
    name = "nvim-treesitter",
    build = ":TSUpdate"
  },
}
local opts = {}

-- Treesitter

require("lazy").setup(plugins, opts)

-- === Plugins Setup ===
require("everforest").setup({
  vim.cmd.colorscheme "everforest"
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

