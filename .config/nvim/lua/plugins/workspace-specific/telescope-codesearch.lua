local telescope_codesearch = {
  url = "sso://googler@user/vintharas/telescope-codesearch.nvim",
  dependencies = {
    { "nvim-telescope/telescope.nvim" },
    { "nvim-lua/plenary.nvim" },
    { "nvim-tree/nvim-web-devicons" },
  },
  keys = {
    -- { "<leader>gf", desc = "Codesearch using telescope" },
    {
      "<leader>gff",
      function()
        require("telescope").extensions.codesearch.find_files({})
      end,
      desc = "Fuzzy find files in codesearch",
      noremap = true,
      silent = true,
    },

    {
      "<leader>gfg",
      function()
        require("telescope").extensions.codesearch.find_query({})
      end,
      desc = "Search using codesearch queries",
      noremap = true,
      silent = true,
    },

    {
      "<leader>gfG",
      function()
        require("telescope").extensions.codesearch.find_query({ default_text_expand = "<cword>" })
      end,
      desc = "Search for the word under cursor",
      noremap = true,
      silent = true,
    },

    {
      "<leader>gfF",
      function()
        require("telescope").extensions.codesearch.find_files({ default_text_expand = "<cword>" })
      end,
      desc = "Search for a file having word under cursor in its name",
      noremap = true,
      silent = true,
    },
  },
}

local which_key = {
  "folke/which-key.nvim",
  opts = { defaults = { ["<leader>gf"] = { name = "Find" } } },
}

return {
  telescope_codesearch,
  which_key,
}
