return {
  'Civitasv/cmake-tools.nvim',
  config = function()
    require('cmake-tools').setup {
      cmake_runner = {
        default_opts = {
          terminal = {},
        },
      },
    }
  end,

  vim.keymap.set('n', '<leader>cmr', ':CMakeRun<CR>', { desc = 'CMakeRun' }),
}
