local options = {
  shiftwidth = 4,
  tabstop = 4,
  autoindent = false,
  timeoutlen = 600,
  -- Adicione outras aqui
  number = true,
  relativenumber = true,
}

-- Configurações para o Netrw (Explorador nativo)
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_browse_split = 0
vim.g.netrw_winsize = 25 -- Define que o explorador ocupa 25% da tela

for k, v in pairs(options) do
  vim.opt[k] = v
end
