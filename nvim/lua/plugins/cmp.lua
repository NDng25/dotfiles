-- lua/plugins/cmp.lua
return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = { "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip" },
  config = function()
    local cmp = require("cmp")
    -- lua/plugins/completion.lua
    cmp.setup({
      snippet = { expand = function(args) require("luasnip").lsp_expand(args.body) end },
      mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(), -- Trigger manually
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept suggestion
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then cmp.select_next_item() else fallback() end
        end, { "i", "s" }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp", group_index = 2 }, -- LSP first
        { name = "copilot",  group_index = 2 }, -- Copilot second
        { name = "luasnip",  group_index = 2 },
      }, {
        { name = "buffer" },
      }),
    })
  end,
}
