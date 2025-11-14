function OpenExplorer(directory)
  directory = directory or nil
  local explorer = Snacks.picker.get({ source = 'explorer' })[1]

  if directory then
    if explorer ~= nil then
      explorer:set_cwd(directory)
      explorer:refresh()
      explorer:focus()
    else
      Snacks.explorer.open { cwd = vim.fn.stdpath 'config' }
    end
  else
    if explorer == nil then
      Snacks.picker.explorer()
    else
      local cwd = vim.fn.getcwd()
      if explorer:cwd() ~= cwd then
        explorer:set_cwd(cwd)
        explorer:refresh()
        explorer:focus()
      elseif not explorer:is_focused() then
        explorer:focus()
      else
        explorer:close()
      end
    end
  end
end

return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  ---@module "snacks"
  ---@type snacks.Config
  opts = {
    explorer = {
      enabled = true,

      replace_netrw = true, -- Replace netrw with the snacks explorer
    },
    indent = { enabled = true },
    input = { enabled = true },
    notifier = { enabled = true },
    picker = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = false }, -- we set this in options.lua
    toggle = { enabled = true },
    words = { enabled = true },
  },
    -- stylua: ignore
    keys = {
      { "<leader>n", function()
        if Snacks.config.picker and Snacks.config.picker.enabled then
          Snacks.picker.notifications()
        else
          Snacks.notifier.show_history()
        end
      end, desc = "Notification History" },
      { "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
      { "<leader>or", function() Snacks.explorer.reveal() end, desc = "Reveal Snacks Explorer" },
      -- { "<leader>oe", function() Snacks.explorer.open() end, desc = "Open Snacks Explorer" },
      -- { "<leader>oc", function() Snacks.explorer.open({cwd = vim.fn.stdpath('config')}) end, desc = "Open Config Folder"},

      { "<leader>oe", function() OpenExplorer() end, desc = "Open Snacks Explorer" },
      { "<leader>oc", function() OpenExplorer(vim.fn.stdpath('config')) end, desc = "Open Config Folder"},
    },
}
