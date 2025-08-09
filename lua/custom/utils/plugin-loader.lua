-- Enhanced plugin loader with better maintainability
local M = {}

-- Configuration for plugin categories
local PLUGIN_CATEGORIES = {
  'lsp',
  'ui',
  'editor',
  'tools',
}

-- Enhanced error handling with context
local function safe_require(module_path)
  local ok, result = pcall(require, module_path)
  if not ok then
    vim.notify(string.format('Failed to load plugin module: %s\nError: %s', module_path, result), vim.log.levels.ERROR)
    return nil
  end
  return result
end

-- Validate plugin configuration
local function validate_plugin_config(config, module_path)
  if type(config) ~= 'table' then
    vim.notify(string.format('Invalid plugin config in %s: expected table, got %s', module_path, type(config)), vim.log.levels.WARN)
    return false
  end
  return true
end

-- Normalize plugin configuration to array format
local function normalize_plugin_config(config)
  -- Handle single plugin (starts with string)
  if config[1] and type(config[1]) == 'string' then
    return { config }
  end

  -- Handle array of plugins
  if #config > 0 then
    return config
  end

  -- Handle empty or invalid config
  return {}
end

-- Load plugins from a specific category directory
function M.load_category(category)
  local plugins = {}
  local module_dir = vim.fn.stdpath 'config' .. '/lua/custom/plugins/' .. category

  -- Check if directory exists
  if vim.fn.isdirectory(module_dir) == 0 then
    return plugins
  end

  local files = vim.fn.glob(module_dir .. '/*.lua', false, true)

  for _, file in ipairs(files) do
    local module_name = vim.fn.fnamemodify(file, ':t:r')
    local module_path = 'custom.plugins.' .. category .. '.' .. module_name

    local plugin_config = safe_require(module_path)
    if plugin_config and validate_plugin_config(plugin_config, module_path) then
      local normalized_plugins = normalize_plugin_config(plugin_config)
      for _, plugin in ipairs(normalized_plugins) do
        table.insert(plugins, plugin)
      end
    end
  end

  return plugins
end

-- Load all plugin categories
function M.load_all()
  local all_plugins = {}

  for _, category in ipairs(PLUGIN_CATEGORIES) do
    local category_plugins = M.load_category(category)
    vim.list_extend(all_plugins, category_plugins)
  end

  return all_plugins
end

-- Get plugin statistics for debugging
function M.get_stats()
  local stats = {
    total_plugins = 0,
    categories = {},
  }

  for _, category in ipairs(PLUGIN_CATEGORIES) do
    local plugins = M.load_category(category)
    stats.categories[category] = #plugins
    stats.total_plugins = stats.total_plugins + #plugins
  end

  return stats
end

return M
