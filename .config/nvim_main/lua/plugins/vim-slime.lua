return {
  'jpalardy/vim-slime',
  desc = 'Send code from Neovim to terminal sessions (tmux/screen/etc)',
  config = function()
    vim.g.slime_target = 'tmux'

    vim.g.slime_python_ipython = 0

    vim.g.slime_bracketed_paste = 0

    -- Function to automatically target the next tmux window (+1 from current)
    local function get_next_tmux_window()
      local tmux_info = vim.fn.system "tmux display-message -p '#S:#I'"
      local session, window = tmux_info:match '([^:]+):(%d+)'
      if session and window then
        local next_window = tonumber(window) + 1
        return { socket_name = 'default', target_pane = session .. ':' .. next_window }
      end
      -- Fallback if we can't determine current window
      return { socket_name = 'default', target_pane = '{next}' }
    end

    vim.g.slime_default_config = get_next_tmux_window()

    vim.keymap.set('n', '<leader>rs', '<Plug>SlimeParagraphSend', { desc = 'Send current line/paragraph' })
    vim.keymap.set('v', '<leader>rs', '<Plug>SlimeRegionSend', { desc = 'Send selected region' })

    vim.keymap.set('n', '<leader>rb', '<Plug>SlimeParagraphSend', { desc = 'Send code block/paragraph' })

    vim.keymap.set('n', '<leader>rc', ':SlimeConfig<CR>', { desc = 'Configure slime target pane' })

    vim.keymap.set('n', '<leader>rf', function()
      vim.fn['slime#send']('python3 ' .. vim.fn.expand '%:p' .. '\r')
    end, { desc = 'Run current Python file' })

    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'python',
      desc = 'Auto-configure vim-slime for Python files',
      callback = function()
        -- Refresh tmux pane targeting when opening Python files
        vim.g.slime_default_config = get_next_tmux_window()
      end,
    })
  end,
}
