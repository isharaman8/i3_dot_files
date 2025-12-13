return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    -- local util = require("lspconfig.util")

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

    lspconfig.bashls.setup({
      capabilities = capabilities,
    })

    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      settings = {
        Lua = {
          runtime = {
            version = "LuaJIT", -- Neovim uses LuaJIT
          },
          diagnostics = {
            globals = { "vim" }, -- prevent "undefined global 'vim'" error
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false, -- avoid popup asking about third-party
          },
          telemetry = {
            enable = false,
          },
        },
      },
    })

    -- local function lsp_on_attach(client, bufnr)
    --   -- optional: show hover on CursorHold
    --   -- vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
    -- end
    --
    -- lspconfig.eslint.setup({
    --   capabilities = capabilities,
    --   -- on_attach = lsp_on_attach,
    --   -- optional: make eslint server start in project roots only
    --   root_dir = function(fname)
    --     return util.root_pattern(".eslintrc*", "package.json", ".git")(fname)
    --   end,
    --   settings = {
    --     -- keep default behavior; you can tune rules here if needed
    --   },
    -- })
  end,
}
