return {
	{ -- Collection of various small independent plugins/modules
		"echasnovski/mini.nvim",
		config = function()
			-- Better Around/Inside textobjects
			--
			-- Examples:
			--  - va)  - [V]isually select [A]round [)]paren
			--  - yinq - [Y]ank [I]nside [N]ext [Q]uote
			--  - ci'  - [C]hange [I]nside [']quote
			require("mini.ai").setup({ n_lines = 500 })
			require("mini.splitjoin").setup({})
			require("mini.sessions").setup({})
			require("mini.misc").setup({})
			require("mini.pairs").setup({})
			-- require('mini.files').setup {
			--   options = {
			--     premanent_delete = false,
			--     use_as_default_explorer = false,
			--   },
			-- }
			-- vim.keymap.set('n', '<leader>-', function()
			--   MiniFiles.open()
			-- end)
		end,
	},
}
