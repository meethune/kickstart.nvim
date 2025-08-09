-- Enhanced nvim-tree file explorer
return {
  'nvim-tree/nvim-tree.lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  keys = {
    { '<C-n>', '<cmd>NvimTreeToggle<cr>', desc = 'Toggle NvimTree' },
    { '<leader>e', '<cmd>NvimTreeFocus<cr>', desc = 'Focus NvimTree' },
    { '<leader>ef', '<cmd>NvimTreeFindFile<cr>', desc = 'Find File in Tree' },
  },
  config = function()
    -- Disable netrw
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    require('nvim-tree').setup {
      sort_by = 'case_sensitive',
      view = {
        width = 35,
        side = 'left',
        adaptive_size = true,
      },
      renderer = {
        group_empty = true,
        highlight_git = true,
        icons = {
          show = {
            git = true,
            folder = true,
            file = true,
            folder_arrow = true,
          },
        },
      },
      filters = {
        dotfiles = false, -- Show dotfiles by default
        custom = { '.git', 'node_modules', '.cache' },
      },
      git = {
        enable = true,
        ignore = false,
      },
      actions = {
        open_file = {
          quit_on_open = false,
          resize_window = true,
        },
      },
    }
  end,
}
