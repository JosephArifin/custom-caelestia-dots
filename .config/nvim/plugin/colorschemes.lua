vim.pack.add({
	{ src = "https://github.com/catppuccin/nvim" },
})

require("catppuccin").setup({
	transparent_background = true,
	float = {
		transparent = true,
		solid = true,
	},
})
vim.cmd([[colorscheme catppuccin-mocha]])
