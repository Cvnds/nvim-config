local keymap = vim.keymap
local opts = { silent = true }

-- Atalho para salvar (Leader é o espaço, como definimos no init.lua)
keymap.set("n", "<leader>w", ":w<CR>", opts)
keymap.set("n", "<leader>W", ":w<CR>", opts)

-- mapeia para netrw para controlar arquivos 
keymap.set("n", "<leader>n", ":Lexplore<CR>", opts)

vim.api.nvim_create_autocmd('filetype', {
  pattern = 'netrw',
  callback = function()
    local opts = { buffer = true, remap = true }
    
    -- Agora sim: 'a' cria arquivo, 'r' renomeia, 'x' deleta
    vim.keymap.set('n', 'a', '%', opts)
    vim.keymap.set('n', 'r', 'R', opts)
    vim.keymap.set('n', 'x', 'D', opts)
    
    -- Navegação estilo H e L (Voltar e Entrar)
    vim.keymap.set('n', 'H', 'u', opts) -- 'u' no netrw volta um diretório
    vim.keymap.set('n', 'L', '<CR>', opts) -- Enter para entrar
  end
})

-- Esc para sair do terminal (Terminal Mode)
-- Nota: no Neovim, o comando correto para voltar ao modo normal no terminal é <C-\><C-n>
keymap.set("t", "<leader><ESC>", [[<C-\><C-n>]], opts)

-- Navegação entre Janelas (Splits)
keymap.set("n", "<C-j>", "<C-w>j", opts)
keymap.set("n", "<C-k>", "<C-w>k", opts)
keymap.set("n", "<C-l>", "<C-w>l", opts)
keymap.set("n", "<C-h>", "<C-w>h", opts)

-- Atalhos de Tabs (Abas)
keymap.set("n", "<A-t>h", ":tabprevious<CR>", opts)
keymap.set("n", "<A-t>l", ":tabnext<CR>", opts)
keymap.set("n", "<A-t>k", ":tabnew<CR>", opts)
keymap.set("n", "<A-t>j", ":tabclose<CR>", opts)
 -- Mapeia o <leader>c para a função nativa de comentar linha
vim.keymap.set("n", "<leader>c", "gcc", { remap = true, desc = "Comentar linha" })

-- Mapeia o <leader>c para comentar a seleção no modo Visual
vim.keymap.set("x", "<leader>c", "gc", { remap = true, desc = "Comentar seleção" })

-- Navegar entre arquivos abertos (Buffers)
vim.keymap.set("n", "<S-L>", ":bnext<CR>", { desc = "Próximo buffer" })
vim.keymap.set("n", "<S-H>", ":bprevious<CR>", { desc = "Buffer anterior" })

-- Fechar o arquivo atual sem fechar o Neovim
vim.keymap.set("n", "<leader>x", ":bd<CR>", { desc = "Fechar buffer atual" })

-- Limpa os destaques da busca (o amarelado) ao apertar Esc
vim.keymap.set("n", "<Esc>", "<cmd>noh<CR>")
