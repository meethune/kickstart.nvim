-- Web devicons configuration
return {
  'nvim-tree/nvim-web-devicons',
  lazy = false, -- Load immediately since many plugins depend on it
  priority = 1000, -- Load before other UI plugins
  config = function()
    require('nvim-web-devicons').setup({
      override = {
        zsh = {
          icon = "",
          color = "#428850",
          cterm_color = "65",
          name = "Zsh"
        }
      },
      color_icons = true,
      default = true,
      strict = true,
      override_by_filename = {
        [".gitignore"] = {
          icon = "",
          color = "#f1502f",
          name = "Gitignore"
        }
      },
      override_by_extension = {
        ["log"] = {
          icon = "",
          color = "#81e043",
          name = "Log"
        }
      },
    })
  end,
}