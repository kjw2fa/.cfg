-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua

-- Used to create an autocmd group name
local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

-- This autocmd is used to jump to the last insert in any buffer through the register E
-- For example, in normal mode "`E" will jump to the position in register E (see :h `)
--
-- The "command" parameter is equivalent to executing :normal! mE
-- normal! executes the following text as a normal command (see :h normal)
-- mE marks the current position into the register E
vim.api.nvim_create_autocmd({ "InsertLeave" }, {
  group = augroup("last_insert_in_any_buffer"),
  command = "normal! mE",
  desc = "Mark last insert in any buffer in register E",
})
