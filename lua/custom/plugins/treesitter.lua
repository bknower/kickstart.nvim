return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate", -- Command to run after installation to update parsers
  opts = {
    ensure_installed = { -- List of languages for which parsers should be installed
      "lua",
      "vim",
      "javascript",
      "typescript",
      "html",
      "css",
      "python",
      "c",
      "cpp",
    },
    highlight = {
      enable = true, -- Enable Treesitter highlighting
      additional_vim_regex_highlighting = true, -- Optional: Enable or disable additional Vim regex highlighting
    },
    indent = {
      enable = true, -- Enable Treesitter-based indentation
    },
    context_commentstring = { enable = true }, -- Optional: Enable context-aware comment strings
    incremental_selection = { enable = true }, -- Optional: Enable incremental selection
    textobjects = { enable = true }, -- Optional: Enable Treesitter text objects
    autotag = { enable = true }, -- Optional: Enable autotagging for HTML/XML
  },
}
