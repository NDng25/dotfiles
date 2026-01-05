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

  {
    "zbirenbaum/copilot.lua",
    requires = {
      "copilotlsp-nvim/copilot-lsp", -- (optional) for NES functionality
    },
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        panel = {
          enabled = false,
          },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          hide_during_completion = true,
          debounce = 75,
          trigger_on_accept = true,
          keymap = {
            accept = "<M-Enter>",
            accept_word = false,
            accept_line = true,
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
          },
        },
        nes = {
          enabled = true, -- requires copilot-lsp as a dependency
          auto_trigger = true,
          keymap = {
            accept_and_goto = false,
            accept = false,
            dismiss = false,
          },
        },
      })
    end,
  },
  --
  -- {
  --   "zbirenbaum/copilot-cmp",
  --   config = function()
  --     require("copilot_cmp").setup()
  --   end
  -- }
  
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
