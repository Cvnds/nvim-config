return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      -- Usar pcall evita que o Neovim trave se o módulo sumir
      local status, configs = pcall(require, "nvim-treesitter.configs")
      if not status then
          return
      end

      configs.setup({
        ensure_installed = { "lua", "vim", "vimdoc", "markdown", "markdown_inline" },
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
}
