-- Git integration tools
return {
  'tpope/vim-fugitive',
  keys = {
    { '<leader>gs', '<cmd>Git<cr>', desc = 'Git Status' },
    { '<leader>gc', '<cmd>Git commit<cr>', desc = 'Git Commit' },
    { '<leader>gp', '<cmd>Git push<cr>', desc = 'Git Push' },
    { '<leader>gl', '<cmd>Git log<cr>', desc = 'Git Log' },
    { '<leader>gd', '<cmd>Gvdiffsplit<cr>', desc = 'Git Diff' },
  },
}
