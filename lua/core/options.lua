local options = {
  shiftwidth = 4,
  tabstop = 4,
  autoindent = false,
  timeoutlen = 300,
  -- Adicione outras aqui
  number = true,
  relativenumber = true,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
