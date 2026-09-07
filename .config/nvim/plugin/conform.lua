vim.pack.add({
    {
        src = "https://github.com/stevearc/conform.nvim.git",
    }
})

require("conform").setup({
    format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback"
    },
    formatters_by_ft = {
        json = { "biome" },
        html = { "superhtml" }
    }
})
