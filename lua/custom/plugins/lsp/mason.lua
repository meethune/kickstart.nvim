-- Mason LSP server installer
return {
  'mason-org/mason.nvim',
  build = function()
    pcall(vim.api.nvim_command, 'MasonUpdate')
  end,
  opts = {},
}
