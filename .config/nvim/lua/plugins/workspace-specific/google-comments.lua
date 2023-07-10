local google_comments = {
  url = "sso://@user/chmnchiang/google-comments",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    {
      "]c",
      function()
        require("google.comments").goto_next_comment()
      end,
      desc = "Go to next comment",
    },
    {
      "[c",
      function()
        require("google.comments").goto_prev_comment()
      end,
      desc = "Go to prev comment",
    },
    {
      "<Leader>glc",
      function()
        require("google.comments").toggle_line_comments()
      end,
      desc = "Toggle line comments",
    },
    {
      "<Leader>gac",
      function()
        require("google.comments").toggle_all_comments()
      end,
      desc = "Toggle all comments",
    },
  },
  -- config = function()
  --
  --   require("google.comments").setup({
  --     display = { floating = true },
  --   })
  --
  --   vim.fn.sign_define("COMMENTS_ICON", { text = "" })
  --   require("google.comments").setup({
  --     sign = "COMMENTS_ICON",
  --   })
  -- end,
}

local which_key = {
  "folke/which-key.nvim",
  opts = {
    defaults = {
      ["<leader>gl"] = { name = "Toggle line comments" },
      ["<leader>ga"] = { name = "Toggle line comments" },
    },
  },
}

return { google_comments, which_key }
