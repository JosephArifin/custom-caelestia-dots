vim.pack.add({
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/mason-org/mason-lspconfig.nvim.git" },
    { src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim.git" }
})

require("mason").setup()
require("mason-lspconfig").setup()
require("mason-tool-installer").setup({
    ensure_installed = {
        -- lua
        "lua_ls",

        -- python
        "basedpyright",

        -- webdev
        "superhtml",
        "cssls",
        "vtsls",

        -- c/cpp
        "clangd",
        "clang-format"
    }
})

vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using
                -- (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {
                    "vim",
                    "require",
                },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {
                    vim.env.VIMRUNTIME
                },
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
})
