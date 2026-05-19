vim.pack.add({
    {
        src = "https://github.com/mfussenegger/nvim-lint.git",
    },
})

local lint = require("lint")

lint.linters_by_ft = {}

vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "InsertChange", "TextChanged" }, {
    callback = function()
        if vim.opt_local.modifiable:get() then
            lint.try_lint()
        end
    end,
})
