-- ~/.config/nvim/lua/plugins/conform.lua
return {
  "stevearc/conform.nvim",
  opts = {
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
      formatters = {
        command = "pnpm",
        args = { "prettier", "--stdin-filepath", "$FILENAME" },
      },
    },
    formatters_by_ft = {
      javascript = { "prettier" },
      typescript = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" },
      json = { "prettier" },
      css = { "prettier" },
      html = { "prettier" },
      yaml = { "prettier" },
      markdown = { "prettier" },
      go = { "goimports" },
      c = { "clang_format" },
      cpp = { "clang_format" },
      python = { "black" },
    },
  },
}
