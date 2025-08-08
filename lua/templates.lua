-- File templates for automatic insertion on new files
local M = {}

-- Template definitions
M.templates = {
  py = {
    "#!/usr/bin/env python",
    "# $Id$",
    "# -*- coding: utf-8 -*-",
    "",
    "",
    "",
    "# vim:syntax=python",
    "# vim:sw=4:softtabstop=4:expandtab",
  },
  
  sh = {
    "#!/usr/bin/env bash",
    "# $Id$",
    "",
    "",
    "",
    "# vim:syntax=sh",
    "# vim:sw=4:softtabstop=4:expandtab",
  },
  
  -- Example: Add more templates as needed
  -- lua = {
  --   "-- Lua script",
  --   "-- $Id$",
  --   "",
  --   "",
  --   "",
  --   "-- vim:syntax=lua",
  --   "-- vim:sw=2:softtabstop=2:expandtab",
  -- },
}

-- Insert template for given file extension
-- @param ext string: file extension (without dot)
-- @return boolean: true if template was inserted, false otherwise
function M.insert_template(ext)
  local template = M.templates[ext]
  if not template then
    return false
  end
  
  -- Insert the template lines
  vim.api.nvim_buf_set_lines(0, 0, -1, false, template)
  -- Position cursor after the empty lines in the middle (line 4 for most templates)
  vim.api.nvim_win_set_cursor(0, {4, 0})
  -- Enter insert mode
  vim.cmd('startinsert')
  
  return true
end

-- Get list of supported file extensions
-- @return table: array of supported extensions
function M.get_supported_extensions()
  local extensions = {}
  for ext, _ in pairs(M.templates) do
    table.insert(extensions, ext)
  end
  return extensions
end

-- Generate autocmd patterns for supported extensions
-- @return table: array of patterns like "*.py", "*.sh"
function M.get_autocmd_patterns()
  local patterns = {}
  for ext, _ in pairs(M.templates) do
    table.insert(patterns, "*." .. ext)
  end
  return patterns
end

return M