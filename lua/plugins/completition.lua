return {
  {
    "rafamadriz/friendly-snippets",
    config = function()
      -- Isso carrega os snippets do plugin para o LuaSnip
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
}
