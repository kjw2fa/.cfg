return {
  url = "sso://user/vicentecaycedo/cmp-buganizer",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("cmp").setup({
      sources = {
        { name = "buganizer" },
      },
    })
  end,
}
