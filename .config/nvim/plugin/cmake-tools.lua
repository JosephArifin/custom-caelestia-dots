vim.pack.add({
    -- Deps lol
    "https://github.com/mfussenegger/nvim-dap.git",
    "https://github.com/rcarriga/nvim-dap-ui.git",
    "https://github.com/mason-org/mason.nvim.git",
    "https://github.com/nvim-neotest/nvim-nio.git",
    "https://github.com/jay-babu/mason-nvim-dap.nvim.git",
    "https://github.com/nvim-lua/plenary.nvim.git",

    "https://github.com/Civitasv/cmake-tools.nvim.git"
})
require('cmake-tools').setup {
    cmake_runner = {
        default_opts = {
            terminal = {},
        },
    }
}
vim.keymap.set('n', '<leader>cmr', ':CMakeRun<CR>', { desc = 'CMakeRun' })
vim.keymap.set('n', '<leader>cmd', ':CMakeDebug<CR>', { desc = 'CMakeDebug' })
