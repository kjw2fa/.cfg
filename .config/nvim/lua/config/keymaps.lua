-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
local keymap = vim.keymap.set

-- Go to last edit in any buffer. The register "E" stores the location of the last edit in any buffer due to the autocommand in autocmds.lua
keymap("n", "gE", "`E", { desc = "Go to last edit in any buffer" })

-- Set jk to escape
keymap("i", "jk", "<Esc>", { desc = "Exit insert mode" })

-- Have 0 go to first text in the line rather than actual beginning of line.
keymap("n", "0", "^")

-- Remap capital W/Q to write/quit. This is useful since ":" requires the shift key so the next letter is often accidentally capitalized
keymap("c", "W", "w")
keymap("c", "WQ", "wq")
keymap("c", "Wq", "wq")
keymap("c", "W", "w")
keymap("c", "Q", "q")

-- Open figtree
keymap("n", "<Leader>h", ":Figtree<CR>", { silent = true, desc = "Open Figtree" })

-- nvim tmux navigation
local nvim_tmux_nav = require("nvim-tmux-navigation")
keymap("n", "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
keymap("n", "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
keymap("n", "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
keymap("n", "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
-- keymap('n', "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
-- keymap('n', "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)

-- <cmd>Telescope citc modified<cr>

-- keymap("v", "<Leader>r", "<Plug>ReplaceWithRegisterVisual")

-- WHICH KEY MAPPINGS --
local wk = require("which-key")

local function deep_copy(tbl)
  local copy = {}
  for key, value in pairs(tbl) do
    if type(value) ~= "table" then
      copy[key] = value
    else
      copy[key] = deep_copy(value)
    end
  end
  return copy
end

local default_wk_opts = {
  mode = "n", -- NORMAL mode
  prefix = "",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
  expr = false, -- use `expr` when creating keymaps
}

local visual_wk_opts = deep_copy(default_wk_opts)
visual_wk_opts["mode"] = "v"

local normalKeymaps = {
  ["<leader>"] = {
    -- ReplaceWithRegister plugin
    r = { "<Plug>ReplaceWithRegisterOperator", "Replace with register operator" },
    rr = { "<Plug>ReplaceWithRegisterLine", "Replace line with register" },

    -- neocitc plugin
    fw = {
      "<cmd>lua require('neocitc').pick_workspace()<CR>",
      "Pick citc workspace",
    },

    fm = {
      "<cmd>Telescope citc modified<cr>",
      "Find modified files in the workspace",
    },
  },
}

local visualKeymaps = {
  ["<leader>"] = {
    r = { "<Plug>ReplaceWithRegisterVisual", "Replace with register" },
  },
}

wk.register(normalKeymaps)
wk.register(visualKeymaps, visual_wk_opts)
