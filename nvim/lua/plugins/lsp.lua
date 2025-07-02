return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- 🔧 Global Diagnostic Settings
    vim.diagnostic.config({
      virtual_text = true, -- Inline error messages
      signs = true, -- Gutter signs
      underline = true, -- Underline issues
      update_in_insert = false,
      severity_sort = true,
    })

    -- Example: JS/TS (auto-imports will work!)
    lspconfig.tsserver.setup({
      capabilities = capabilities,
    })

    -- Example: Python
    lspconfig.pyright.setup({
      capabilities = capabilities,
    })

    -- Example: HTML
    lspconfig.html.setup({
      capabilities = capabilities,
    })

    -- Example: CSS
    lspconfig.cssls.setup({
      capabilities = capabilities,
    })

    -- C/C++
    lspconfig.clangd.setup({
      capabilities = capabilities,
    })

    -- Add more servers if you want
    -- GO
    lspconfig.gopls.setup({
      capabilities = capabilities,
      settings = {
        gopls = {
          analyses = {
            unusedparams = true,
            unreachable = true,
          },
          staticcheck = true,
          gofumpt = true,
        },
      },
    })
  end,
}
