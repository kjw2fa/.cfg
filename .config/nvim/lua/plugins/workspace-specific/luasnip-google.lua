return {
  url = "sso://googler@user/mccloskeybr/luasnip-google.nvim",
  config = function()
    require("luasnip-google").load_snippets()
  end,
}
