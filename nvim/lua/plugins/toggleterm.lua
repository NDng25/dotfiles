return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {
    -- Open terminal at the bottom with 15 lines of height
    size = 15,
    open_mapping = [[<c-t>]], -- Toggle with Ctrl + t
    hide_numbers = true,
    shade_terminals = true,
    start_in_insert = true,   -- Automatically enter terminal mode
    direction = "vertical", -- Use "vertical" or "float" if preferred
  }
}
