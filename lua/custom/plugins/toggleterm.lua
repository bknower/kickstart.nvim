local toggleterm_manager = require 'toggleterm-manager'
local actions = toggleterm_manager.actions
return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    ---@module "toggleterm"
    --    ---@type ToggleTermConfig
    opts = {--[[ things you want to change go here]]
      -- open_mapping = [[<leader>ot]],
      insert_mappings = true,
      terminal_mappings = true,
      start_in_insert = true,
      autochdir = true,
      persist_mode = false,
      -- direction = 'vertical',
    },
    -- require('toggleterm').setup,
    -- keys = {
    --   { "<leader>oe", function() toggleterm. end, desc = "Open Snacks Explorer" },
    -- }
  },
  {
    'ryanmsnyder/toggleterm-manager.nvim',
    dependencies = {
      'akinsho/nvim-toggleterm.lua',
      'nvim-telescope/telescope.nvim',
      'nvim-lua/plenary.nvim', -- only needed because it's a dependency of telescope
    },
    config = function()
      require('toggleterm-manager').setup {

        mappings = {
          i = {
            ['<leader>ot'] = { action = actions.toggle_term, exit_on_action = true },
          },
          n = {
            ['<leader>ot'] = { action = actions.toggle_term, exit_on_action = true },
          },
          t = {
            ['<leader>ot'] = { action = actions.toggle_term, exit_on_action = true },
          },
        },
      }
    end,
  },
}
