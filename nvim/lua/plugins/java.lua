return {
    "mfussenegger/nvim-jdtls",
    dependencies = { "neovim/nvim-lspconfig" },
    ft = { "java" }, -- Only load when opening Java files
}
