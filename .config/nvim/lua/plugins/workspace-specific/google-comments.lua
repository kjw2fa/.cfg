return {
  url = "sso://@user/chmnchiang/google-comments",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "]lc", [[<Cmd>lua require('google.comments').goto_next_comment()<CR>]], "Go to next comment" },
    { "[lc", [[<Cmd>lua require('google.comments').goto_prev_comment()<CR>]], "Go to prev comment" },
    { "<Leader>lc", [[<Cmd>lua require('google.comments').toggle_line_comments()<CR>]], "Toggle line comments" },
    { "<Leader>ac", [[<Cmd>lua require('google.comments').toggle_all_comments()<CR>]], "" },
  },
  config = function()
    vim.fn.sign_define("COMMENTS_ICON", { text = "C" })
    require("google.comments").setup({
      sign = "COMMENTS_ICON",
    })
  end,
}
