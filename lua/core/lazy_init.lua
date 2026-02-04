-- 1. Caminho onde o lazy.nvim será instalado (pasta de dados padrão do nvim)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- 2. Bootstrap: baixa o gestor se ele não existir
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

-- 3. Adiciona ao runtime path para o Lua conseguir dar o 'require' nele
vim.opt.rtp:prepend(lazypath)

-- 4. Configuração do Lazy
require("lazy").setup({
  spec = {
    -- Isso faz o Lazy ler a pasta 'lua/plugins/' automaticamente
    -- Cada arquivo .lua lá dentro deve retornar uma tabela de plugins
    { import = "plugins" },
  },
  
  -- Interface visual
  ui = {
    border = "rounded",
    icons = {
      cmd = "⌘", config = "🛠", event = "📅", ft = "📂",
      init = "⚙", keys = "🗝", plugin = "🔌", runtime = "💻",
      require = "🌙", source = "📄", start = "🚀", task = "📌", lazy = "💤 ",
    },
  },

  -- Performance e Outros
  checker = { enabled = true }, -- Checa atualizações de plugins automaticamente
  change_detection = { notify = false }, -- Não avisa toda vez que você salvar a config
})
