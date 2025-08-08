-- Rose Pine colorscheme with enhanced configuration
return {
  'rose-pine/neovim',
  name = 'rose-pine',
  priority = 1000,
  config = function()
    require('rose-pine').setup({
      variant = 'auto', -- auto, main, moon, or dawn
      dark_variant = 'main', -- main, moon, or dawn
      dim_inactive_windows = false,
      extend_background_behind_borders = true,
      styles = {
        bold = true,
        italic = true,
        transparency = true, -- Enhanced transparency support
      },
    })
    
    -- Apply colorscheme (transparency handled globally in init.lua)
    vim.cmd.colorscheme('rose-pine')
  end,
}
