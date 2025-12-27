return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
    opts = {
    -- The new API typically uses a flatter structure
    ensure_installed = { "java", "lua", "go", "typescript" },
    highlight = { enable = true },
    indent = { enable = true },
  },
  config = function ()
    vim.api.nvim_create_autocmd('FileType', {
        pattern = { '<filetype>' },
        callback = function() vim.treesitter.start() end,
    })
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
}
