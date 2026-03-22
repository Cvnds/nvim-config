-- Define a leader antes de tudo
vim.g.mapleader = " "

-- Chama os módulos core
require("core.options")
require("core.keymaps")

-- Chama o gestor de plugins (Lazy)
require("core.lazy_init") -- Você pode mover o código do Lazy para cá também
