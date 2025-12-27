return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    opts = function()
      -- Helper function to get active LSP clients
      local function lsp_client_name()
        local msg = "No LSP"
        local buf_ft = vim.bo.filetype
        local clients = vim.lsp.get_clients({ bufnr = 0 })
        if next(clients) == nil then return msg end
        local client_names = {}
        for _, client in ipairs(clients) do
          table.insert(client_names, client.name)
        end
        return "[" .. table.concat(client_names, ", ") .. "]"
      end

      return {
        options = {
          theme = "catppuccin", -- Automatically syncs with Catppuccin
          globalstatus = true,   -- Modern: one statusline for the whole editor
          component_separators = { left = "｜", right = "｜" },
          section_separators = { left = "", right = "" },
          disabled_filetypes = {
            statusline = { "dashboard", "alpha", "neo-tree" },
          },
        },
        -- The 'tabline' option puts the buffer list at the very top of the editor
        tabline = {
          lualine_a = {
            {
              "buffers",
              show_filename_only = true,   -- False: show relative path
              hide_filename_extension = false,
              show_modified_status = true,
              mode = 2, -- 0: name, 1: index, 2: name + index
              max_length = vim.o.columns * 0.8, 
              filetype_names = {
                TelescopePrompt = "Telescope",
                dashboard = "Dashboard",
                packer = "Packer",
                fzf = "FZF",
                alpha = "Alpha",
              },
              use_mode_colors = true,
              buffers_color = {
                active = "lualine_a_normal",     -- High contrast for current file
                inactive = "lualine_c_normal",   -- Dimmed for background files
              },
              symbols = {
                modified = " ●",      -- Text to show when the buffer is modified
                alternate_file = "", -- Text to show to identify the alternate file
                directory =  "",     -- Text to show when the buffer is a directory
              },
            },
          },
          lualine_z = { "tabs" }, -- Shows actual Neovim tabs on the far right
        },
        sections = {
          lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = {
            { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
            { "filename", path = 1 }, -- 1: Relative path
          },
          lualine_x = {
            { lsp_client_name, icon = " ", color = { fg = "#ffffff", gui = "bold" } },
            "encoding",
            "fileformat",
          },
          lualine_y = { "progress" },
          lualine_z = {
            { "location", separator = { right = "" }, left_padding = 2 },
          },
        },
      }
    end,
    config = function(_, opts)
      require("lualine").setup(opts)
    end,
  },
}
