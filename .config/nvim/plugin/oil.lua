vim.pack.add({ "https://github.com/stevearc/oil.nvim.git" })

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

vim.keymap.set('n', '<leader>-', require('oil').toggle_float, { desc = "Oil File Manager" })
