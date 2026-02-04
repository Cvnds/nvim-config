-- Para teste remover mais tarde
-- -- Pega o caminho do diretório onde este init.lua está
local config_path = vim.fn.fnamemodify(vim.fn.expand("<sfile>"), ":p:h")

-- Adiciona esse caminho ao Runtime Path para o Neovim achar a pasta /lua
vim.opt.rtp:prepend(config_path)
--
-- Define a leader antes de tudo
vim.g.mapleader = " "

-- Chama os módulos core
require("core.options")
require("core.keymaps")

-- Chama o gestor de plugins (Lazy)
require("core.lazy_init") -- Você pode mover o código do Lazy para cá também

