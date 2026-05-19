vim.pack.add({ "https://github.com/romus204/tree-sitter-manager.nvim.git" })

require("tree-sitter-manager").setup({
    ensure_installed = {
        "html",
        "python",
        "javascript",
        "css",
        "json",
    }
})
