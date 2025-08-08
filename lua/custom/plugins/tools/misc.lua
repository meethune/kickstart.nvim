-- Miscellaneous utility plugins
return {
  -- Template system
  { 'vigoux/templar.nvim' },
  
  -- GnuPG file handling
  { 'jamessan/vim-gnupg' },
  
  -- Smart line numbering
  { 'sitiom/nvim-numbertoggle' },
  
  -- Rust development tools
  { 
    'simrat39/rust-tools.nvim',
    ft = 'rust',
    opts = {},
  },
}