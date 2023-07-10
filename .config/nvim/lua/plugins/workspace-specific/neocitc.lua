return {
  url = "sso://team/neovim-dev/neocitc",
  keys = {
    {
      "<leader>gfw",
      function()
        require("neocitc").pick_workspace()
      end,
      desc = "Find citc workspace",
    },
    { "<leader>gfm", "<cmd>Telescope citc modified<cr>", desc = "Find modified files in the workspace" },
  },
}
