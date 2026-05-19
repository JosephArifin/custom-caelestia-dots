vim.cmd("packadd nvim.undotree")
vim.keymap.set("n", "<leader>|", require("undotree").open, { desc = "Toggle undotree" })
