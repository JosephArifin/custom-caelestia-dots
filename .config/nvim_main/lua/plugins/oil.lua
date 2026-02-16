return {
  'stevearc/oil.nvim',
  opts = {},
  dependencies = { { 'nvim-mini/mini.icons', opts = {} } },

  config = function()
    require('oil').setup {
      default_file_explorer = true,
      delete_to_trash = true,
      skip_confirm_for_simple_edits = true,
      view_options = {
        show_hidden = true,
        natural_order = true,
      },
      use_default_keymaps = true,
      keymaps = {
        ['-'] = { 'actions.parent', mode = 'n' },
        ['_'] = { 'actions.open_cwd', mode = 'n' },
      },
    }
    vim.keymap.set('n', '<leader>-', require('oil').toggle_float)
  end,
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
}
