vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.mouse = "a"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.title = true
vim.opt.backup = false
vim.opt.cmdheight = 1
vim.opt.scrolloff = 8
vim.opt.breakindent = true
vim.opt.path:append({ "**" })
vim.opt.wildignore:append({ "*/node_modules/*" })
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.winborder = "rounded"
vim.opt.showmode = false
-- vim.opt.formatoptions:append({"r"})

-- yank to clipboard
vim.schedule(function()
    vim.o.clipboard = "unnamedplus"
end)

vim.pack.add({
    { src = "https://github.com/catppuccin/nvim" },
    { src = "https://github.com/ibhagwan/fzf-lua" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/mason-org/mason.nvim" },
})

-- Colorscheme
require("catppuccin").setup({
    transparent_background = true,
})
vim.cmd [[colorscheme catppuccin-mocha]]

-- Fzf-lua
require "fzf-lua".setup()
vim.keymap.set('n', '<leader>sb', ':FzfLua<CR>', { desc = 'FzfLua builtin' })
vim.keymap.set('n', '<leader>sf', ':FzfLua files<CR>', { desc = 'FzfLua search files' })

-- Mason
require("mason").setup()

-- LSP config
vim.lsp.enable({ 'emmylua_ls' })
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)
