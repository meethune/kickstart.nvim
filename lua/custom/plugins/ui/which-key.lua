-- Enhanced which-key for better keybinding discovery
return {
  'folke/which-key.nvim',
  event = 'VimEnter',
  config = function()
    require('which-key').setup()
    require('which-key').add {
      { '<leader>f', group = 'Find' },
      { '<leader>g', group = 'Git' },
      { '<leader>b', group = 'Buffer' },
      { '<leader>p', group = 'Project' },
    }
  end,
}
