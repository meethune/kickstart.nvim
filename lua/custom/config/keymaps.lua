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
    -- Diagnostic keymaps
    { 'n', '<leader>pm', vim.diagnostic.open_float, 'Open Diagnostic Float' },

    -- LSP navigation keymaps using telescope for better UX
    { 'n', 'gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition' },
    { 'n', 'gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences' },
    { 'n', 'gi', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation' },
    { 'n', 'gt', require('telescope.builtin').lsp_type_definitions, '[G]oto [T]ype Definition' },
    { 'n', 'gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration' },

    -- LSP actions
    { 'n', 'K', vim.lsp.buf.hover, 'Hover Documentation' },
    { 'n', '<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame Symbol' },
    { 'n', '<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction' },

    -- Document/Workspace symbols
    { 'n', '<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols' },
    { 'n', '<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols' },
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
      desc = desc,
    })
  end
end

-- Additional non-LSP keymaps that should be consistent across the config
M.general_keymaps = function()
  return {
    -- Legacy telescope keymaps that some users might prefer
    { 'n', '<leader>pf', '<cmd>Telescope find_files<cr>', 'Find Files' },
    { 'n', '<C-p>', '<cmd>Telescope git_files<cr>', 'Git Files' },
    { 'n', '<leader>fw', '<cmd>Telescope live_grep<cr>', 'Live Grep' },
    { 'n', '<leader>fb', '<cmd>Telescope buffers<cr>', 'Find Buffers' },
    { 'n', '<leader>fh', '<cmd>Telescope help_tags<cr>', 'Help Tags' },
    { 'n', '<leader>fr', '<cmd>Telescope oldfiles<cr>', 'Recent Files' },
  }
end

-- Setup general keymaps
function M.setup_general_keymaps()
  local keymaps = M.general_keymaps()
  for _, keymap in ipairs(keymaps) do
    local mode, lhs, rhs, desc = keymap[1], keymap[2], keymap[3], keymap[4]
    vim.keymap.set(mode, lhs, rhs, {
      silent = true,
      desc = desc,
    })
  end
end

-- Initialize all custom keymaps
function M.setup()
  M.setup_general_keymaps()
end

return M
