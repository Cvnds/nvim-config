local keymap = vim.keymap
local opts = { silent = true }

-- Atalho para salvar (Leader é o espaço, como definimos no init.lua)
keymap.set("n", "<leader>w", ":w<CR>", opts)
keymap.set("n", "<leader>W", ":w<CR>", opts)

-- Esc para sair do terminal (Terminal Mode)
-- Nota: no Neovim, o comando correto para voltar ao modo normal no terminal é <C-\><C-n>
keymap.set("t", "<leader><ESC>", [[<C-\><C-n>]], opts)

-- Navegação entre Janelas (Splits)
keymap.set("n", "<C-j>", "<C-w>j", opts)
keymap.set("n", "<C-k>", "<C-w>k", opts)
keymap.set("n", "<C-l>", "<C-w>l", opts)
keymap.set("n", "<C-h>", "<C-w>h", opts)

-- Atalhos de Tabs (Abas)
keymap.set("n", "<A-h>", ":tabprevious<CR>", opts)
keymap.set("n", "<A-l>", ":tabnext<CR>", opts)
keymap.set("n", "<A-k>", ":tabnew<CR>", opts)
keymap.set("n", "<A-j>", ":tabclose<CR>", opts)
