local map = vim.keymap.set

-- Shift + h/l for immediate buffer switching (mimics tab behavior)
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })

-- Quick jump to specific buffers (Lualine mode 2 shows indices)
for i = 1, 9 do
  map("n", "<leader>" .. i, function()
    vim.api.nvim_command("buffer " .. i)
  end, { desc = "Jump to Buffer " .. i })
end

-- Close buffer (keeps the window open)
map("n", "<leader>x", "<cmd>bp|bd #<cr>", { desc = "Close Buffer, Save Layout" })
