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

-- WHICH KEY MAPPINGS --
--
-- Which key displays available key maps with a description when typing a command.
--
-- This section should only be for group mappings.
-- For key mappings, specify the description directly in the key map.
--
local wk = require("which-key")

-- local default_wk_opts = {
--   mode = "n", -- NORMAL mode
--   prefix = "",
--   buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
--   silent = true, -- use `silent` when creating keymaps
--   noremap = true, -- use `noremap` when creating keymaps
--   nowait = false, -- use `nowait` when creating keymaps
--   expr = false, -- use `expr` when creating keymaps
-- }

local normalKeymaps = {
  ["<leader>"] = {
    g = {
      name = "Google/git",
      t = {
        name = "Test",
      },
    },
  },
}

wk.register(normalKeymaps)
