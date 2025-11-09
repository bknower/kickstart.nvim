return {
  "chipsenkbeil/distant.nvim",
  branch = "v0.3",

  -- 1. 'cmd' is moved to the top level, where lazy.nvim expects it.
  --cmd = {
  --  "DistantLaunch",
  --  "DistantConnect",
  --  "DistantDisconnect",
  --  "DistantInstall",
  --  "DistantStop",
  --  "DistantToggle",
  --  "Distant",
  --},

  -- 2. We use a 'config' function to call setup with a colon ':'
  config = function()
    require("distant"):setup()
  end,
}
