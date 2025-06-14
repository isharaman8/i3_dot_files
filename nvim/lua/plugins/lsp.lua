return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

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

    -- Add more servers if you want
  end,
}
