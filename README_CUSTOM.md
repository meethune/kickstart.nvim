# Custom Neovim Configuration

> **A professionally organized, modular Neovim configuration built on kickstart.nvim with modern 0.11+ features**

## ✨ Features

### 🎨 **Beautiful & Functional**
- **Rose Pine colorscheme** with optional transparency
- **Smart transparency management** that works with any terminal
- **Modern UI** with bufferline, statusline, and file explorer
- **Nerd Font icons** throughout the interface

### ⚡ **Development Powerhouse**
- **Modern LSP setup** using Neovim 0.11+ APIs (`vim.lsp.config()`)
- **Intelligent completion** with nvim-cmp and multiple sources
- **Fast file navigation** with Telescope and fzf integration
- **Advanced syntax highlighting** with TreeSitter text objects
- **Git integration** with fugitive, gitsigns, and diff tools

### 🗂️ **Modular Architecture**
- **Clean separation** of plugins by category (LSP, UI, Editor, Tools)
- **Easy maintenance** with logical file organization
- **Extensible design** for adding new plugins
- **Smart plugin loader** with error handling and debugging

### 🔧 **Enhanced Productivity**
- **Code formatting** with conform.nvim
- **Auto-pairs** with TreeSitter integration
- **Undo history** visualization with undotree
- **Template system** with templar.nvim
- **TODO highlighting** and project-wide search

## 📁 **Project Structure**

```
kickstart.nvim/
├── init.lua                          # Main configuration entry point
├── lua/custom/
│   ├── transparency.lua              # Transparency management module
│   ├── config/
│   │   └── keymaps.lua              # Centralized keymap definitions
│   ├── utils/
│   │   └── plugin-loader.lua        # Enhanced plugin loading system
│   └── plugins/                      # Modular plugin organization
│       ├── init.lua                 # Plugin loader entry point
│       ├── lsp/                     # Language Server Protocol
│       │   ├── mason.lua           # LSP server installer
│       │   ├── servers.lua         # Server configurations
│       │   └── completion.lua      # Autocompletion setup
│       ├── ui/                      # User Interface
│       │   ├── colorscheme.lua     # Rose Pine theme
│       │   ├── bufferline.lua      # Tab/buffer management
│       │   ├── icons.lua           # File type icons
│       │   ├── fidget.lua          # LSP progress indicator
│       │   └── which-key.lua       # Keymap discovery
│       ├── editor/                  # Editor Enhancements
│       │   ├── telescope.lua       # Fuzzy finder
│       │   ├── treesitter.lua      # Syntax highlighting
│       │   ├── nvim-tree.lua       # File explorer
│       │   ├── autopairs.lua       # Smart bracket pairing
│       │   ├── mini.lua            # Mini.nvim modules
│       │   └── guess-indent.lua    # Auto-detect indentation
│       └── tools/                   # Development Tools
│           ├── formatting.lua      # Code formatting
│           ├── git.lua             # Git integration
│           ├── gitsigns.lua        # Git signs in gutter
│           ├── undotree.lua        # Undo history
│           ├── todo-comments.lua   # TODO highlighting
│           └── misc.lua            # Utility plugins
├── templates/                        # Code templates
├── vimrc/                           # Legacy vim configurations
└── docs/                            # Documentation
    ├── INSTALL.md                   # Installation guide
    ├── MIGRATION_SUMMARY.md         # Migration details
    ├── MODULAR_ORGANIZATION.md      # Architecture overview
    └── PLUGIN_FIXES.md              # Troubleshooting guide
```

## 🚀 **Quick Start**

### Prerequisites
See [INSTALL.md](INSTALL.md) for detailed installation requirements.

**Essential dependencies:**
- Neovim 0.11.0+
- Git, Make, Unzip, Curl
- Ripgrep (rg)
- C compiler (gcc/clang)
- Nerd Font (for icons)

### Installation

1. **Backup existing config:**
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   ```

2. **Install this configuration:**
   ```bash
   git clone <your-repo> ~/.config/nvim
   ```

3. **Launch Neovim:**
   ```bash
   nvim
   ```
   Plugins will install automatically on first launch.

4. **Verify setup:**
   ```vim
   :checkhealth
   ```

## ⌨️ **Key Bindings**

### Core Navigation
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>` | Space | Leader key |
| `<C-s>` | Save | Save current file |
| `<C-n>` | File Tree | Toggle nvim-tree |
| `<leader>e` | Focus Tree | Focus file explorer |

### File Finding (Telescope)
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>pf` | Find Files | Search files in project |
| `<C-p>` | Git Files | Search git-tracked files |
| `<leader>fw` | Live Grep | Search text in project |
| `<leader>fb` | Buffers | Find open buffers |
| `<leader>fr` | Recent | Recently opened files |

### LSP & Development
| Key | Action | Description |
|-----|--------|-------------|
| `gd` | Go to Definition | Jump to symbol definition |
| `gr` | References | Show symbol references |
| `<leader>rn` | Rename | Rename symbol |
| `<leader>ca` | Code Action | Show available code actions |
| `<leader>dd` | Hover | Show documentation |
| `<leader>f` | Format | Format current buffer |

### Git Integration
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>gs` | Git Status | Open fugitive status |
| `<leader>gc` | Git Commit | Create git commit |
| `<leader>gd` | Git Diff | Show git diff |

### Transparency
| Command | Action |
|---------|--------|
| `:TransparentToggle` | Toggle transparency on/off |
| `:TransparentOn` | Enable transparency |
| `:TransparentOff` | Disable transparency |

## 🎨 **Customization**

### Adding New Plugins

1. **Choose the right category:**
   - `lsp/` - Language servers, completion
   - `ui/` - Visual appearance, interface
   - `editor/` - Text editing, navigation
   - `tools/` - Development utilities

2. **Create plugin file:**
   ```lua
   -- lua/custom/plugins/category/my-plugin.lua
   return {
     'author/plugin-name',
     config = function()
       require('plugin-name').setup({
         -- configuration
       })
     end,
   }
   ```

3. **Restart Neovim** - the plugin loader will automatically discover it

### Modifying Keymaps

Edit `lua/custom/config/keymaps.lua` to modify LSP and shared keymaps, or edit individual plugin files for plugin-specific bindings.

### Changing Colorscheme

Edit `lua/custom/plugins/ui/colorscheme.lua` to change themes while maintaining transparency support.

### Transparency Settings

Modify transparency behavior in `lua/custom/transparency.lua` or via the setup call in `init.lua`:

```lua
require('custom.transparency').setup({
  default_transparent = true  -- false for opaque by default
})
```

## 🔍 **Troubleshooting**

### Common Issues

**Plugins not loading?**
```vim
:Lazy sync
:checkhealth lazy
```

**LSP not working?**
```vim
:Mason
:checkhealth mason
:LspInfo
```

**Icons not showing?**
- Install a Nerd Font
- Verify `vim.g.have_nerd_font = true` in init.lua

**Transparency not working?**
- Check terminal true color support
- For tmux users: see [INSTALL.md](INSTALL.md) tmux configuration

### Health Checks

The configuration includes comprehensive health checks:

```vim
:checkhealth          " Overall system health
:checkhealth kickstart " Kickstart-specific checks
:checkhealth mason     " LSP server status
:checkhealth telescope " Search functionality
```

## 🏗️ **Architecture Philosophy**

This configuration follows several key principles:

### **Modularity First**
- Each plugin has its own file
- Clear separation by functionality
- Easy to enable/disable features

### **Modern Neovim**
- Uses Neovim 0.11+ native APIs
- No deprecated functions
- Forward-compatible design

### **Professional Standards**
- Comprehensive error handling
- Detailed documentation
- Consistent code patterns
- Easy maintenance

### **User Experience**
- Sensible defaults
- Discoverable features
- Transparent transparency management
- Performance optimized

## 🤝 **Contributing**

When modifying this configuration:

1. **Follow the modular structure** - keep plugins in appropriate categories
2. **Document changes** - update relevant .md files
3. **Test thoroughly** - run `:checkhealth` after changes
4. **Maintain compatibility** - ensure Neovim 0.11+ requirements

## 📄 **License**

Based on kickstart.nvim. See [LICENSE.md](LICENSE.md) for details.

---

**Built with ❤️ on top of [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim)**
