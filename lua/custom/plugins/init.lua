-- Enhanced modular plugin configuration loader
-- Uses the improved plugin loader utility

local plugin_loader = require('custom.utils.plugin-loader')

-- Load all plugins using the enhanced loader
local all_plugins = plugin_loader.load_all()

-- Optional: Debug plugin loading (uncomment for troubleshooting)
-- local stats = plugin_loader.get_stats()
-- print(string.format('Loaded %d plugins across %d categories', stats.total_plugins, vim.tbl_count(stats.categories)))

return all_plugins