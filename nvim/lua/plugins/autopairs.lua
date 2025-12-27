return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    dependencies = { "hrsh7th/nvim-cmp" },
    config = function()
      local autopairs = require("nvim-autopairs")

      autopairs.setup({
        check_ts = true, -- Enable Tree-sitter integration
        ts_config = {
          lua = { "string" }, -- Don't add pairs in lua string nodes
          javascript = { "template_string" }, -- Don't add pairs in js template strings
        },
        disable_filetype = { "TelescopePrompt", "spectre_panel" },
        fast_wrap = {
          map = "<M-e>", -- Alt-e to wrap the word under cursor
          chars = { "{", "[", "(", '"', "'" },
          offset = 0, -- Offset from pattern match
          end_key = "$",
          keys = "qwertyuiopzxcvbnmasdfghjkl",
          check_comma = true,
          highlight = "PmenuSel",
          highlight_grey = "LineNr",
        },
      })

      -- Integration with nvim-cmp
      -- If you use nvim-cmp, this automatically adds '(' after selecting a function
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local cmp = require("cmp")
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },
}
