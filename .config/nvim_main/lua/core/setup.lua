vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true
vim.o.termguicolors = false

-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

vim.o.winborder = "rounded"

-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
vim.opt.relativenumber = true

-- Tabs
vim.opt.tabstop = 4 -- How many tabs to render, does it matter, ¯\_(ツ)_/¯
vim.opt.softtabstop = 4 -- How many tabs to soft stop which idk what it means lol
vim.opt.shiftwidth = 4 -- How many tabs are inserted aka the important one
vim.opt.expandtab = true -- Tabs vs Spaces debate. If true spaces, false tabs

vim.opt.autoindent = true
vim.opt.smartindent = true -- :help smartindent

-- Line wrap
vim.opt.wrap = true

-- Swap file
vim.opt.swapfile = false

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = "a"

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 8
vim.o.pumblend = 0
vim.o.winblend = 0

-- Obsidian nvim
vim.opt.conceallevel = 1

-- No comment on enter or o
vim.api.nvim_create_autocmd("Filetype", {
	pattern = { "*" },
	callback = function()
		local ft = vim.bo.filetype
		if ft == "python" then
			vim.opt_local.formatoptions:remove({ "r", "o" })
			vim.opt_local.commentstring = "# %s"
		else
			vim.opt_local.formatoptions:remove({ "r", "o" })
		end
	end,
	desc = "Don't continue comments with o, O, or enter",
})

vim.api.nvim_create_autocmd("Filetype", {
	pattern = "java",
	callback = function(args)
		require("core.jdtls_setup").setup()
	end,
})
vim.g.loaded_netrw = 0
vim.g.loaded_netrwPlugin = 0
