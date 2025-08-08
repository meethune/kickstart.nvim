-- Mason LSP server installer
return {
  'williamboman/mason.nvim',
  build = function()
    pcall(vim.api.nvim_command, 'MasonUpdate')
  end,
  opts = {},
}