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

    -- 🔁 Show floating diagnostics on hover (CursorHold)
    -- vim.o.updatetime = 500
    -- vim.api.nvim_create_autocmd("CursorHold", {
    --   callback = function()
    --     vim.diagnostic.open_float(nil, {
    --       focusable = false,
    --       close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
    --       border = "rounded",
    --       source = "always",
    --       prefix = " ",
    --     })
    --   end,
    -- })

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
