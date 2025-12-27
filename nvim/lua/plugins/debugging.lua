return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
        "theHamsta/nvim-dap-virtual-text",
        "jay-babu/mason-nvim-dap.nvim",
    },
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")

        -- 1. Setup Mason-DAP for automatic installation
        require("mason-nvim-dap").setup({
            ensure_installed = { "python", "codelldb" }, -- Add your primary languages
            automatic_installation = true,
            handlers = {},
        })

        -- 2. Initialize UI and Virtual Text
        dapui.setup()
        require("nvim-dap-virtual-text").setup({})

        -- 3. Automatic UI lifecycle
        dap.listeners.before.attach.dapui_config = function() dapui.open() end
        dap.listeners.before.launch.dapui_config = function() dapui.open() end
        dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
        dap.listeners.before.event_exited.dapui_config = function() dapui.close() end

        -- 4. Keybindings (Mnemonic: d = Debug)
        local key = vim.keymap.set
        key("n", "<F5>", dap.continue, { desc = "Debug: Start/Continue" })
        key("n", "<F1>", dap.step_into, { desc = "Debug: Step Into" })
        key("n", "<F2>", dap.step_over, { desc = "Debug: Step Over" })
        key("n", "<F3>", dap.step_out, { desc = "Debug: Step Out" })
        key("n", "<leader>db", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
        key("n", "<leader>dB", function()
            dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
        end, { desc = "Debug: Set Conditional Breakpoint" })
        key("n", "<leader>du", dapui.toggle, { desc = "Debug: Toggle UI" })
    end,
}
