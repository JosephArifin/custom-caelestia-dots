vim.pack.add({
    {
        src = "https://github.com/saghen/blink.lib.git"
    },
    {
        src = "https://github.com/saghen/blink.cmp.git",
        version = vim.version.range("^1")
    }
})

local blink = require("blink.cmp")
blink.setup({
    keymap = {
        preset = 'default',

        ['<C-n>'] = { function() require("blink.cmp").show() end, "select_next" },
        ['<C-p>'] = { function() require("blink.cmp").show() end, "select_prev" }
    },
    appearance = {
        nerd_font_variant = 'mono'
    },
    completion = {
        keyword = {
            range = 'full',
        },
        ghost_text = {
            enabled = true
        },
        documentation = {
            auto_show = true,
            auto_show_delay_ms = 0,
        },
    },
    signature = {
        enabled = true,
        trigger = {
            show_on_insert = false,
        },
    },
    sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
    fuzzy = {
        implementation = "prefer_rust_with_warning",
        prebuilt_binaries = {
            download = true,
            ignore_version_mismatch = false,
        }
    }
})
