return {
  -- Main autocomplete plugin
  "hrsh7th/nvim-cmp",

  enabled = true,

  -- Load cmp dependencies
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
  },

  -- Make sure cmp is loaded immediately
  event = { "InsertEnter", "CmdlineEnter" },

  -- Config
  opts = function(_, opts)
    local cmp = require("cmp")

    opts.completion = {
      autocomplete = { require("cmp.types").cmp.TriggerEvent.TextChanged },
    }

    opts.mapping = cmp.mapping.preset.insert({

      -- Smart <CR>
      ["<CR>"] = cmp.mapping(function(fallback)
        if cmp.visible() and cmp.get_selected_entry() then
          cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
        else
          fallback()
        end
      end, { "i", "s" }),

      -- Smart <S-Tab>
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        else
          fallback()
        end
      end, { "i", "s" }),
    })

    opts.sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "buffer" },
      { name = "path" },
    })
  end,
}
