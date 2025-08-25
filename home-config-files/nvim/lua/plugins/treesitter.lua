return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "go",
      "lua",
      "json",
      "typescript",
      "tsx",
      "html",
      "css",
      "python",
      "bash",
    },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
  },
}
