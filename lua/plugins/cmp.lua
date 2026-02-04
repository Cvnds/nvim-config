return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "onsails/lspkind.nvim", -- Plugin para ícones
	  "hrsh7th/cmp-buffer",  -- Adicione esta linha
      "hrsh7th/cmp-path",
    },
    config = function()
      local cmp = require("cmp")
      local lspkind = require("lspkind")

      cmp.setup({
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        -- Deixa as janelas do menu e da documentação bonitas
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          -- Tecla Tab para navegar entre os campos do snippet
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif require("luasnip").expand_or_jumpable() then
              require("luasnip").expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        -- Configuração visual dos itens (Ícone + Nome + Fonte)
        formatting = {
          format = lspkind.cmp_format({
            mode = 'symbol_text', -- Mostra ícone e texto
            maxwidth = 50,
            ellipsis_char = '...',
            before = function (entry, vim_item)
              -- Identifica de onde vem o item (LSP, Snippet, etc)
              vim_item.menu = ({
                nvim_lsp = "[LSP]",
                luasnip = "[Snip]",
                buffer = "[File]",
                path = "[Path]",
              })[entry.source.name]
              return vim_item
            end
          })
        },
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        }, {
          { name = 'buffer' },
          { name = 'path' },
        })
      })
    end,
  }
}

