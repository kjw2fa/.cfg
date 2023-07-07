-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Set up cider lsp (https://g3doc.corp.google.com/devtools/cider/ciderlsp/neovim/README.md?cl=head)
local nvim_lspconfig = require("lspconfig")
local lsp_configs = require("lspconfig.configs")

-- Supported filetypes: https://g3doc.corp.google.com/devtools/cider/ciderlsp/README.md?cl=head#supported
local supported_filetypes = { "java", "dart", "proto", "textproto" }

-- Set up cider lsp
lsp_configs.ciderlsp = {
  default_config = {
    cmd = { "/google/bin/releases/cider/ciderlsp/ciderlsp", "--tooltag=nvim-lsp", "--noforward_sync_responses" },
    filetypes = supported_filetypes,
    root_dir = nvim_lspconfig.util.root_pattern("google3/*BUILD"),
    settings = {},
  },
}

nvim_lspconfig.ciderlsp.setup({})

-- Set up analysis lsp
lsp_configs.analysislsp = {
  default_config = {
    cmd = { "/google/bin/users/lerm/glint-ale/analysis_lsp/server", "--lint_on_save=false", "--max_qps=10" },
    filetypes = supported_filetypes,
    -- root_dir = lspconfig.util.root_pattern('BUILD'),
    root_dir = function(fname)
      return string.match(fname, "(/google/src/cloud/[%w_-]+/[%w_-]+/google3/).+$")
    end,
    settings = {},
  },
}

nvim_lspconfig.analysislsp.setup({
  -- capabilities = capabilities,
  -- on_attach = on_attach,
})

-- Modify nvim-cmp configuration.
local source_names = {
  nvim_lsp = "(LSP)",
  emoji = "(Emoji)",
  path = "(Path)",
  calc = "(Calc)",
  cmp_tabnine = "(Tabnine)",
  vsnip = "(Snippet)",
  luasnip = "(Snippet)",
  buffer = "(Buffer)",
  tmux = "(TMUX)",
  nvim_ciderlsp = "(ML-Autocompletion!)",
}

local cmp = require("cmp")
cmp.setup({

  -- other config lines from cmp-nvim
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "path" },
    { name = "buffer" },
    { name = "nvim_ciderlsp" },
  }),

  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      -- vim_item.kind = kind_icons[vim_item.kind]
      vim_item.menu = source_names[entry.source.name]
      -- vim_item.dup = duplicates[entry.source.name]
      return vim_item
    end,
  },
})

-- Modify cmp-nvim-lsp configuration.
--
--This is standard cmp_nvim_lsp config
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- This is the line we add to advertise support for ML-completion.
capabilities = require("cmp_nvim_ciderlsp").update_capabilities(capabilities)

--This is part of the standard way to configure "cmp_nvim_lsp" and isn't
-- specific to our ciderlsp ML completion source.
-- The following example advertise capabilities to `clangd`.
require("lspconfig").clangd.setup({
  capabilities = capabilities,
})

require("cmp_nvim_ciderlsp").setup({
  multiline_summary_symbol = "…",
})
