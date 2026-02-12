return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" }, -- Permite formatar ao salvar
  cmd = { "ConformInfo" },
  keys = {
    {
      -- Atalho para formatar manualmente
      "<leader>f",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      mode = "",
      desc = "Formatar buffer",
    },
  },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      nix = { "nixpkgs_fmt" },
      -- python = { "isort", "black" },
    },
    -- Formatar automaticamente ao salvar
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
  },
}
