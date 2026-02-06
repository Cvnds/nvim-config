return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require('gitsigns').setup({
        -- Símbolos customizados (opcional)
        signs = {
          add          = { text = '┃' },
          change       = { text = '┃' },
          delete       = { text = '_' },
          topdelete    = { text = '‾' },
          changedelete = { text = '~' },
          untracked    = { text = '┆' },
        },
        -- Atalhos úteis para navegação entre alterações
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          -- Navegar entre "hunks" (blocos de alteração)
          vim.keymap.set('n', ']c', function()
            if vim.wo.diff then return ']c' end
            vim.schedule(function() gs.next_hunk() end)
            return '<Ignore>'
          end, { expr = true, buffer = bufnr })

          vim.keymap.set('n', '[c', function()
            if vim.wo.diff then return '[c' end
            vim.schedule(function() gs.prev_hunk() end)
            return '<Ignore>'
          end, { expr = true, buffer = bufnr })

          -- Ações: Preview do que mudou na linha
          vim.keymap.set('n', '<leader>hp', gs.preview_hunk, { buffer = bufnr })
          vim.keymap.set('n', '<leader>hb', function() gs.blame_line{full=true} end, { buffer = bufnr })
        end
      })
    end
  }
}
