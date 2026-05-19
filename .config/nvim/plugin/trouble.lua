vim.pack.add({
    "https://github.com/JosephArifin/trouble.nvim.git"
})

require("trouble").setup()

local keymaps = {
    { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>",              desc = "Diagnostics (Trouble)", },
    { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)", },
    { "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>",      desc = "Symbols (Trouble)", },
    { "<leader>cl", "<cmd>Trouble lsp toggle focus=false<cr>",          desc = "LSP Definitions / references / ... (Trouble)", },
    { "<leader>xL", "<cmd>Trouble loclist toggle<cr>",                  desc = "Location List (Trouble)", },
    { "<leader>xQ", "<cmd>Trouble qflist toggle<cr>",                   desc = "Quickfix List (Trouble)", },
}

for _, map in ipairs(keymaps) do
    vim.keymap.set(map.mode or "n", map[1], map[2], {
        desc = map.desc,
        silent = map.silent ~= false,
        noremap = map.noremap ~= false,
        expr = map.expr or false,
    })
end
