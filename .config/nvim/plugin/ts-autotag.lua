vim.pack.add({
    "https://github.com/tronikelis/ts-autotag.nvim.git"
})

require("ts-autotag").setup({
    auto_rename = {
        enabled = true
    }
})
