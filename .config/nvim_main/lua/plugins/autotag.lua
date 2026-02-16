return { -- autotag html
  'windwp/nvim-ts-autotag',
  event = 'VeryLazy',
  dependencies = 'nvim-treesitter/nvim-treesitter',
  config = function()
    require('nvim-ts-autotag').setup {
      -- Optional: Configure specific filetypes
      filetypes = {
        'html',
        'javascript',
        'typescript',
        'javascriptreact',
        'typescriptreact',
        'svelte',
        'vue',
        'tsx',
        'jsx',
        'xml',
      },
    }
  end,
}
