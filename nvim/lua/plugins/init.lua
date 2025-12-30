return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("configs.treesitter")
    end,
  },
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },
  --
  -- {
  --   "nvim-treesitter/nvim-treesitter",
  --   lazy = false,
  --   build = ":TSUpdate",
  --   opts = {
  --     highlights = {
  --       enable = true,
  --       use_languagetree = true,
  --     },
  --     indent = { enable = true },
  --     ensure_installed = {
  --       "vim", "lua", "vimdoc",
  --       "html", "css", "java", "go",
  --     },
  --   },
  --   config = function()
  --     vim.api.nvim_create_autocmd('FileType', {
  --       pattern = { '<filetype>' },
  --       callback = function() vim.treesitter.start() end,
  --     })
  --     vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  --   end,
  -- },
}
