-- lua/plugins/copilot.lua
return {
    {
      "zbirenbaum/copilot.lua",
      cmd = "Copilot",
      event = "BufReadPost",
      config = function()
        require("copilot").setup({
          -- We disable these to use copilot-cmp instead
          suggestion = { enabled = false },
          panel = { enabled = false },
          filetypes = {
            markdown = true, -- help and markdown are disabled by default
            help = false,
            gitcommit = true,
            cvs = false,
            ["."] = false,
          },
        })
      end,
    },
    {
        "zbirenbaum/copilot-cmp",
        dependencies = "copilot.lua",
        config = function()
          require("copilot_cmp").setup()
        end,
    },
}
