-- pull lazy vim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
-- Load configurations
require('vim-options')
require('lazy').setup('plugins')
require('config.keymap')

-- Function to set transparency for various UI elements
local function set_transparency()
    local highlights = {
        "Normal",
        "NormalFloat",
        "NormalNC", -- Normal text in non-current windows
        "SignColumn",
        "StatusLine",
        "StatusLineNC",
        "EndOfBuffer",
        "MsgArea",
    }
    
    for _, group in ipairs(highlights) do
        vim.api.nvim_set_hl(0, group, { bg = "none", ctermbg = "none" })
    end
end

-- Re-apply transparency after the colorscheme is loaded
vim.api.nvim_create_autocmd("ColorScheme", {
    callback = set_transparency,
})

-- Execute once on startup
set_transparency()
