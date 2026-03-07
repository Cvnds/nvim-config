return {
	"nvim-telescope/telescope-file-browser.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local telescope = require("telescope")

		telescope.setup({
			extensions = {
				file_browser = {
					theme = "ivy",
					-- Substitui o netrw (explorador padrão do Vim) pelo Telescope
					hijack_netrw = true,
					mappings = {
						["i"] = {
							-- Suas configurações de inserção aqui
						},
						["n"] = {
							-- Suas configurações de modo normal aqui
						},
					},
				},
			},
		})

		-- IMPORTANTE: Carrega a extensão para que ela funcione
		telescope.load_extension("file_browser")

		-- Atalho prático para abrir o navegador (Espaço + fb)
		vim.keymap.set("n", "<leader>n", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", {
			desc = "Telescope File Browser",
			silent = true
		})
	end,
}
