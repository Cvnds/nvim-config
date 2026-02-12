return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	lazy = false,
	version = false,
	build = "make",
	opts = {
		provider = "openai",

		providers = {

			-- Configuração da OpenAI
			openai = {
				endpoint = "https://api.openai.com/v1",
				model = "gpt-4o-mini",
				timeout = 30000,
				extra_request_body = {
					temperature = 0,
					max_tokens = 4096,
				},
			},

			-- Mantemos os outros como backup
			ollama = {
				__inherited_from = "openai",
				api_key_name = "",
				endpoint = "http://127.0.0.1:11434/v1",
				model = "qwen2.5-coder:7b",
			},
		},
	},

	behaviour = {
		auto_suggestions = false,
		auto_set_highlight_group = true,
		auto_set_keymaps = true,
	},
	dependencies = {
		"stevearc/dressing.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons",
		"nvim-treesitter/nvim-treesitter",
		{
			"MeanderingProgrammer/render-markdown.nvim",
			opts = { file_types = { "markdown", "Avante" } },
			ft = { "markdown", "Avante" },
		},
	},
}
