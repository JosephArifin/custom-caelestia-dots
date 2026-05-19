local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    error("Error cloning lazy.nvim:\n" .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require("core.setup")
require("core.remaps")
require("lazy").setup({
  -- HTML/XML specific auto-closing tags
  require("plugins.autotag"),

  -- Git Wrapper
  require("plugins.fugitive"),

  -- File History
  require("plugins.undotree"),

  -- Detect tabstop and shiftwidth automatically
  require("plugins.sleuth"),

  -- See `:help gitsigns` to understand what the configuration keys do
  -- Adds git related signs to the gutter, as well as utilities for managing changes
  require("plugins.gitsigns"),

  -- Useful plugin to show you pending keybinds.
  require("plugins.whichkey"),

  -- DAP
  require("plugins.dap"),

  -- Linting
  require("plugins.lint"),

  -- Color Highlighter
  require("plugins.colorizer"),

  -- Automatically detect the indentation style used in a buffer and updating the buffer options accordingly
  require("plugins.guessindent"),

  -- Surround Selections
  require("plugins.surround"),

  require("plugins.snacks-nvim"),

  --COlORS
  require("plugins.colorscheme"),
  -- LSP Plugins
  require("plugins.lsp_config"),

  require("plugins.autoformat"),

  require("plugins.autocomplete"),

  require("plugins.comment_highlight"),

  require("plugins.mini"),

  require("plugins.markview-nvim"),

  require("plugins.treesitter"),

  require("plugins.vim_tmux_nav"),

  require("plugins.trouble-nvim"),

  require("plugins.lualine"),

  require("plugins.yazi-nvim"),

  -- require 'plugins.flash-nvim',

  require("plugins.harpoon"),

  require("plugins.floatingtodo"),

  require("plugins.cmake-tools"),

  require("plugins.obsidian-nvim"),

  require("plugins.vim-slime"),

  require("plugins.oil"),

  require("plugins.system-theme"),

  require("plugins.live-preview"),
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
