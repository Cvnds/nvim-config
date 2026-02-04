return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      -- Para cada linguagem que você instalar via Nix, 

      -- LUA (nix: pkgs.lua-language-server)
      vim.lsp.config('lua_ls', {
        capabilities = capabilities,
        settings = { Lua = { diagnostics = { globals = { "vim" } } } },
      })
      vim.lsp.enable('lua_ls')

      -- PYTHON (nix: pkgs.pyright)
      -- vim.lsp.config('pyright', { capabilities = capabilities })
      -- vim.lsp.enable('pyright')

      -- Atalhos de teclado (LspAttach)
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(ev)
          local opts = { buffer = ev.buf }
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        end,
      })
    end,
  },
}
