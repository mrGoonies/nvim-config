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
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local opts = {}

require("lazy").setup("plugins")

-- === Keymaps ===
vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal right<CR>", {})
vim.keymap.set("n", "<Leader>w", ":w<CR>", {})
