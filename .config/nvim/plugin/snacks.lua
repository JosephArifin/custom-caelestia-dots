vim.pack.add({
    "https://github.com/folke/snacks.nvim.git",
    "https://github.com/JosephArifin/trouble.nvim.git"
})

require("snacks").setup({
    explorer = {
        enabled = true,
    },
    picker = {
        enabled = true,
        exclude = {
            ".git",
            "node_modules",
        },
        layout = {
            preset = "ivy_split",
            layout = {
                height = 0.33,
            },
        },
        actions = require("trouble.sources.snacks").actions,
        win = {
            input = {
                keys = {
                    ["<c-t>"] = {
                        "trouble_open",
                        mode = { "n", "i" },
                    },
                }
            }
        }
    },
    image = { enabled = true },
    input = { enabled = true },
    notifier = { enabled = true },
})

-- keys
local keymaps = {
    -- Top pickers & Explorer
    { "<leader>sp",      function() Snacks.picker() end,                                         desc = "Search Picker", },
    { "<leader>\\",      function() Snacks.explorer.open() end,                                  desc = "Explorer",             mode = "n", },
    { "<leader><space>", function() Snacks.picker.smart() end,                                   desc = "Smart Find Files", },
    -- Find
    { "<leader>sf",      function() Snacks.picker.files() end,                                   desc = "Find Files", },
    { "<leader>sc",      function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
    -- Grep
    { "<leader>sg",      function() Snacks.picker.grep() end,                                    desc = "Grep" },
    -- Search
    { '<leader>s"',      function() Snacks.picker.registers() end,                               desc = "Registers" },
    { "<leader>sr",      function() Snacks.picker.resume() end,                                  desc = "Resume" },
    -- LSP
    { "gd",              function() Snacks.picker.lsp_definitions() end,                         desc = "Goto Definition" },
    { "gD",              function() Snacks.picker.lsp_declarations() end,                        desc = "Goto Declaration" },
    { "<leader>ss",      function() Snacks.picker.lsp_symbols() end,                             desc = "LSP Symbols" },
    { "<leader>sS",      function() Snacks.picker.lsp_workspace_symbols() end,                   desc = "LSP Workspace Symbols" },
}

for _, map in ipairs(keymaps) do
    vim.keymap.set(map.mode or "n", map[1], map[2], {
        desc = map.desc,
        silent = map.silent ~= false,
        noremap = map.noremap ~= false,
        expr = map.expr or false,
    })
end
