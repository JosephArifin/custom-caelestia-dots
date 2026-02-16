return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'

    harpoon:setup()

    local k = vim.keymap

    local function append_to_harpoon()
      local list = harpoon:list()
      local current_file = vim.fn.expand '%:p'

      -- Add the current file with its cursor position
      list:append {
        value = current_file,
        context = {
          row = vim.fn.line '.',
          col = vim.fn.col '.',
        },
      }

      -- Show a notification
      vim.notify('File appended to Harpoon: ' .. vim.fn.expand '%:t', vim.log.levels.INFO)
    end
    -- Toggle the harpoon menu
    k.set('n', '<leader>hm', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = 'Harpoon Menu' })

    -- Append current file to harpoon
    k.set('n', '<leader>ha', append_to_harpoon, { desc = 'Harpoon Append File' })

    -- Navigate to files by index
    k.set('n', '<leader>hq', function()
      harpoon:list():select(1)
    end, { desc = 'Harpoon File 1' })
    k.set('n', '<leader>hw', function()
      harpoon:list():select(2)
    end, { desc = 'Harpoon File 2' })
    k.set('n', '<leader>he', function()
      harpoon:list():select(3)
    end, { desc = 'Harpoon File 3' })
    k.set('n', '<leader>hr', function()
      harpoon:list():select(4)
    end, { desc = 'Harpoon File 4' })
    k.set('n', '<leader>ht', function()
      harpoon:list():select(5)
    end, { desc = 'Harpoon File 5' })
    k.set('n', '<leader>hy', function()
      harpoon:list():select(6)
    end, { desc = 'Harpoon File 6' })
    k.set('n', '<leader>hu', function()
      harpoon:list():select(7)
    end, { desc = 'Harpoon File 7' })
    k.set('n', '<leader>hi', function()
      harpoon:list():select(8)
    end, { desc = 'Harpoon File 8' })
    k.set('n', '<leader>ho', function()
      harpoon:list():select(9)
    end, { desc = 'Harpoon File 9' })

    -- Navigate prev/next in harpoon list
    k.set('n', '<leader>hp', function()
      harpoon:list():prev()
    end, { desc = 'Harpoon Prev File' })
    k.set('n', '<leader>hn', function()
      harpoon:list():next()
    end, { desc = 'Harpoon Next File' })
  end,
}
