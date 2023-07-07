local function goog(plugin, config)
  return {
    name = plugin,
    dir = "/usr/share/vim/google/" .. plugin,
    dependencies = { "maktaba" },
    config = config,
  }
end

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
  goog("ft-dart"),
  goog("ft-cpp"),
  goog("ft-go"),
  goog("ft-java"),
  goog("ft-kotlin"),
  goog("ft-proto"),
  goog("ft-python"),

  goog("ultisnips-google"),
  goog("autogen"),
  goog("blaze"),
  goog("codefmt"),
  goog("codefmt-google"),
  goog("googlestyle"),
  -- goog("relatedfiles", function()
  --   nmap("<leader>r", ":RelatedFilesWindow<cr>")
  -- end),
}
