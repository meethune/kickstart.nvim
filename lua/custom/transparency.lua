-- Transparency management module
local M = {}

-- Function to apply transparency to all relevant highlight groups
function M.apply()
  local transparent_groups = {
    'Normal',
    'NormalFloat',
    'NormalNC',
    'SignColumn',
    'StatusLine',
    'StatusLineNC',
    'TabLine',
    'TabLineFill',
    'TabLineSel',
    'VertSplit',
    'WinSeparator',
    'EndOfBuffer',
  }

  for _, group in ipairs(transparent_groups) do
    vim.api.nvim_set_hl(0, group, { bg = 'none' })
  end
end

-- Function to restore opaque background
function M.restore()
  -- Get current colorscheme instead of hardcoding
  local current_colorscheme = vim.g.colors_name or 'rose-pine'
  vim.cmd('colorscheme ' .. current_colorscheme)
end

-- Function to toggle transparency
function M.toggle()
  local normal_bg = vim.api.nvim_get_hl(0, { name = 'Normal' }).bg
  if normal_bg == nil then
    -- Currently transparent, make opaque
    M.restore()
  else
    -- Currently opaque, make transparent
    M.apply()
  end
end

-- Setup function to create commands and autocommands
function M.setup(opts)
  opts = opts or {}
  local default_transparent = opts.default_transparent ~= false -- Default to true unless explicitly false

  -- Create user commands
  vim.api.nvim_create_user_command('TransparentToggle', M.toggle, { desc = 'Toggle background transparency' })
  vim.api.nvim_create_user_command('TransparentOn', M.apply, { desc = 'Enable background transparency' })
  vim.api.nvim_create_user_command('TransparentOff', M.restore, { desc = 'Disable background transparency' })

  if default_transparent then
    -- Apply transparency by default after colorscheme loads
    vim.api.nvim_create_autocmd('ColorScheme', {
      callback = M.apply,
    })

    -- Also apply transparency on VimEnter in case colorscheme is already loaded
    vim.api.nvim_create_autocmd('VimEnter', {
      callback = M.apply,
    })
  end
end

return M
