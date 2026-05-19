vim.pack.add({
    "https://github.com/Wansmer/treesj.git"
})

require("treesj").setup()

vim.keymap.set("n", "<leader>m", require("treesj").toggle, { desc = "Toggle splitjoin" })
vim.keymap.del("n", "<leader>j")
vim.keymap.del("n", "<leader>s")
