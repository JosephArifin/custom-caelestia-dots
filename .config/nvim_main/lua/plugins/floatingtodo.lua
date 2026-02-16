return {
  -- dir = '~/projects/lua/neovim_plugs/floatingtodo',
  'josepharifin/floatingtodo.nvim',
  config = function()
    require('floatingtodo').setup {
      target_file = '~/Documents/todo.md',
      border = 'rounded',
      width = 0.4,
      height = 0.4,
      position = 'bottomright',
    }
  end,
}
