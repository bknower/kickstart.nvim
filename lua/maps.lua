-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local function map(mode, lhs, rhs)
  vim.keymap.set(mode, lhs, rhs, { silent = true })
end

-- vim.keymap.set({ 'n', 'v', 't' }, '<leader>w', function()
--   vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-w>', true, false, true), 'n', false)
-- end, { desc = 'Window', noremap = true, silent = true })

-- <leader>w → show <C-w> menu and enter the real <C-w> prefix
vim.keymap.set({ 'n', 't' }, '<leader>w', function()
  local wk = require 'which-key'
  -- Always show the normal-mode <C-w> which-key hints
  wk.show { keys = '<C-w>', mode = 'n' }

  local esc = vim.api.nvim_replace_termcodes('<C-\\><C-n>', true, false, true)
  local cw = vim.api.nvim_replace_termcodes('<C-w>', true, false, true)

  if vim.api.nvim_get_mode().mode == 't' then
    -- From terminal: exit to Normal, then send <C-w>
    vim.api.nvim_feedkeys(esc .. cw, 'n', false)
  else
    -- Already in Normal: just send <C-w>
    vim.api.nvim_feedkeys(cw, 'n', false)
  end
end, { desc = 'Window commands', silent = true })
