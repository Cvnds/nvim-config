return {
  {
    "navarasu/onedark.nvim",
    priority = 1000, -- Garante que o tema carregue antes de tudo
    config = function()
      require('onedark').setup({
        -- Estilos disponíveis: 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'
        style = 'darker', 
        transparent = true,     -- A mágica da transparência acontece aqui
        term_colors = true,     -- Usa as cores do tema no terminal integrado
        ending_tildes = false,  -- Esconde os ~ no fim do arquivo
        
        -- Você pode customizar cores específicas aqui se quiser
        highlights = {
          -- Exemplo: deixa os comentários em itálico
          ["@comment"] = { fg = '$grey', fmt = 'italic' },
        },
      })
      require('onedark').load()
    end,
  }
}
