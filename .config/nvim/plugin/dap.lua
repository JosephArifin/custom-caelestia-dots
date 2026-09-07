vim.pack.add({
    "https://github.com/mfussenegger/nvim-dap.git",
    "https://github.com/rcarriga/nvim-dap-ui.git",
    "https://github.com/mason-org/mason.nvim.git",
    "https://github.com/nvim-neotest/nvim-nio.git",
    "https://github.com/jay-babu/mason-nvim-dap.nvim.git"
}
)

-- Mason must be setup before
require("mason").setup()
require("mason-nvim-dap").setup({
    automatic_installation = true,
    ensure_installed = {
        'codelldb',
    },
    handlers = {},
})

local dapui = require 'dapui'
dapui.setup({})

local dap = require 'dap'
dap.listeners.before.attach.dapui_config = function() dapui.open() end
dap.listeners.before.launch.dapui_config = function() dapui.open() end
dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
dap.listeners.before.event_exited.dapui_config = function() dapui.close() end

vim.api.nvim_set_hl(0, 'DapBreak', { fg = '#e51400' })
vim.api.nvim_set_hl(0, 'DapStop', { fg = '#ffcc00' })
local breakpoint_icons = vim.g.have_nerd_font
    and { Breakpoint = '', BreakpointCondition = '', BreakpointRejected = '', LogPoint = '', Stopped = '' }
    or { Breakpoint = '●', BreakpointCondition = '⊜', BreakpointRejected = '⊘', LogPoint = '◆', Stopped = '⭔' }
for type, icon in pairs(breakpoint_icons) do
    local tp = 'Dap' .. type
    local hl = (type == 'Stopped') and 'DapStop' or 'DapBreak'
    vim.fn.sign_define(tp, { text = icon, texthl = hl, numhl = hl })
end

vim.keymap.set('n', '<F5>', function() require('dap').continue() end, { desc = 'Debug: Start/Continue' })
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end, { desc = 'Debug: Step Over' })
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end, { desc = 'Debug: Step Into' })
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end, { desc = 'Debug: Step Out' })
vim.keymap.set('n', '<leader>b', function() require('dap').toggle_breakpoint() end, { desc = 'Debug: Toggle Breakpoint' })
