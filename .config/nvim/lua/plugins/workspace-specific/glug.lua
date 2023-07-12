local function goog(plugin, config)
  return {
    name = plugin,
    dir = "/usr/share/vim/google/" .. plugin,
    dependencies = { "maktaba" },
    config = config,
  }
end

local keymap = vim.keymap.set

return {
  {
    name = "maktaba",
    dir = "/usr/share/vim/google/maktaba",
    init = function()
      vim.cmd("source /usr/share/vim/google/glug/bootstrap.vim")
    end,
  },
  goog("core"),
  goog("glaive"),
  goog("google-filetypes"),
  goog("ft-cpp"),
  goog("ft-go"),
  goog("ft-java"),
  goog("ft-kotlin"),
  goog("ft-proto"),
  goog("ft-python"),

  goog("ultisnips-google"),
  goog("autogen"),
  goog("blaze", function()
    -- vim.cmd("maktaba#Plugin('blaze').Flag('execution_mode', 'async')")
    vim.fn["glug#Plugin('blaze').Flag"]("execution_mode", "async")

    -- vimscript autocommands use the # sytax. vim.fn must use vim.fn["autocommand#function"] syntax for them. (see :h vim.fn)
    keymap("n", "<leader>t", vim.fn["blaze#TestCurrentFile"], { desc = "Test current file with blaze" })
    keymap("n", "<leader>gts", "<cmd>BlazeGoToSponge<cr>", { desc = "Go to sponge" })
    -- This doesn't seem to work. It just tests the current file
    keymap("n", "<leader>gtm", vim.fn["blaze#TestCurrentMethod"], { desc = "Test current method with blaze" })
  end),
  goog("codefmt"),
  goog("codefmt-google"),
  goog("googlestyle"),
  goog("relatedfiles", function()
    keymap("n", "<leader>gr", ":RelatedFilesWindow<cr>", { desc = "Related files" })
  end),
}
