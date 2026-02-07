return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" }, -- Carrega o plugin ao abrir arquivos
  config = function()
    local lint = require("lint")

    -- Define quais linters usar para cada linguagem
    lint.linters_by_ft = {
      lua = { "luacheck" },
      nix = { "nix" },
      -- python = { "flake8" },
    }

    -- Cria um comando para disparar o linting automaticamente ao salvar
    vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
