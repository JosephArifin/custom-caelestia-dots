-- Dependency of mini icons but already installed
vim.pack.add({
    "https://github.com/otavioschwanck/arrow.nvim.git"
})

require('arrow').setup({
    show_icons = true,
    leader_key = ';',        -- Recommended to be a single key
    buffer_leader_key = 'm', -- Per Buffer Mappings
    mappings = {
        edit = "E",
        quit = "Q"
    },
    window = {
        border = "rounded",
    },
    per_buffer_config = {
        sort_automatically = false,
    },
    index_keys = "qwertyuiop1234567890"
})
