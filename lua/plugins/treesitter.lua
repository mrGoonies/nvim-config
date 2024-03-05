return {
  "nvim-treesitter/nvim-treesitter",
  name = "nvim-treesitter",
  build = ":TSUpdate",
  ensure_installed = {
    "lua",
    "python",
    "vim",
    "javascript",
  },
  auto_install = true,
  highlight = {enable = true},
  indent = {enable = true}
}
