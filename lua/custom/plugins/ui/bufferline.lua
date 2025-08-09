-- Enhanced bufferline with better navigation
return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  keys = {
    { '<C-j>', '<cmd>BufferLineCycleNext<cr>', desc = 'Next Buffer' },
    { '<C-k>', '<cmd>BufferLineCyclePrev<cr>', desc = 'Previous Buffer' },
    { '<leader>bd', '<cmd>bdelete<cr>', desc = 'Delete Buffer' },
    { '<leader>bo', '<cmd>BufferLineCloseOthers<cr>', desc = 'Close Other Buffers' },
  },
  opts = {
    options = {
      mode = 'buffers',
      separator_style = 'slant',
      always_show_bufferline = false,
      show_buffer_close_icons = true,
      show_close_icon = true,
      color_icons = true,
      diagnostics = 'nvim_lsp',
      diagnostics_indicator = function(count, level, diagnostics_dict, context)
        local s = ' '
        for e, n in pairs(diagnostics_dict) do
          local sym = e == 'error' and ' ' or (e == 'warning' and ' ' or ' ')
          s = s .. n .. sym
        end
        return s
      end,
    },
  },
}
