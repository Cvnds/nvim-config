-- Define a leader antes de tudo
vim.g.mapleader = " "

-- Chama os módulos core
require("core.options")
require("core.keymaps")

-- Chama o gestor de plugins (Lazy)
require("core.lazy_init") -- Você pode mover o código do Lazy para cá também

-- vim enter apra inicar o nvim em um comando ou tela especifica
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    -- Verifica se você abriu o nvim puro (sem passar um arquivo como 'nvim main.lua')
    if vim.fn.argc() == 0 then
      require("telescope.builtin").find_files()
    end
  end,
})
