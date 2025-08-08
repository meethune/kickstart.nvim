-- Centralized keymap management
local M = {}

-- Common keymap options
M.opts = {
  silent = { silent = true },
  silent_noremap = { silent = true, noremap = true },
  buffer_silent = function(bufnr)
    return { buffer = bufnr, silent = true }
  end,
}

-- LSP keymaps that are reused across language servers
M.lsp_keymaps = function(bufnr)
  return {
    -- Personal keymaps (preserved from original config)
    { 'n', '<leader>dd', vim.lsp.buf.hover, 'LSP Hover' },
    { 'n', '<leader>pm', vim.diagnostic.open_float, 'Open Diagnostic Float' },
    
    -- Standard LSP keymaps  
    { 'n', 'gd', vim.lsp.buf.definition, 'Go to Definition' },
    { 'n', 'gr', vim.lsp.buf.references, 'Go to References' },
    { 'n', 'K', vim.lsp.buf.hover, 'Hover Documentation' },
    { 'n', '<leader>rn', vim.lsp.buf.rename, 'Rename Symbol' },
    { 'n', '<leader>ca', vim.lsp.buf.code_action, 'Code Action' },
  }
end

-- Apply LSP keymaps to buffer
function M.setup_lsp_keymaps(bufnr)
  local keymaps = M.lsp_keymaps()
  for _, keymap in ipairs(keymaps) do
    local mode, lhs, rhs, desc = keymap[1], keymap[2], keymap[3], keymap[4]
    vim.keymap.set(mode, lhs, rhs, { 
      buffer = bufnr, 
      silent = true, 
      desc = desc 
    })
  end
end

-- Telescope keymaps that could be centralized
M.telescope_keymaps = {
  { '<leader>pf', '<cmd>Telescope find_files<cr>', 'Find Files' },
  { '<C-p>', '<cmd>Telescope git_files<cr>', 'Git Files' },
  { '<leader>fw', '<cmd>Telescope live_grep<cr>', 'Live Grep' },
  { '<leader>fb', '<cmd>Telescope buffers<cr>', 'Find Buffers' },
  { '<leader>fh', '<cmd>Telescope help_tags<cr>', 'Help Tags' },
  { '<leader>fr', '<cmd>Telescope oldfiles<cr>', 'Recent Files' },
}

return M