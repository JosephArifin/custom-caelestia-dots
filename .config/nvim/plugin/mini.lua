vim.pack.add({ "https://github.com/nvim-mini/mini.nvim.git" })

require("mini.icons").setup()
require("mini.pairs").setup()
require("mini.splitjoin").setup()
require("mini.surround").setup({
    custom_surroundings = {
        [')'] = { output = { left = '( ', right = ' )' } },
        ['('] = { output = { left = '(', right = ')' } },
        ['['] = { output = { left = '[', right = ']' } },
        [']'] = { output = { left = '[ ', right = ' ]' } },
        ['}'] = { output = { left = '{ ', right = ' }' } },
        ['{'] = { output = { left = '{', right = '}' } },
        ['>'] = { output = { left = '< ', right = ' >' } },
        ['<'] = { output = { left = '<', right = '>' } },
    },
    highlight_duration = 1000,
    mappings = {
        replace = 'sc'
    },
    search_method = "cover_or_next"
})
