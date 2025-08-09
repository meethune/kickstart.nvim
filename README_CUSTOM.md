# Custom Neovim Configuration

> **A professionally organized, modular Neovim configuration built on kickstart.nvim with modern 0.11+ features**

## ✨ Features

### 🎨 **Beautiful & Functional**
- **Rose Pine colorscheme** with optional transparency
- **Smart transparency management** that works with any terminal
- **Modern UI** with bufferline, statusline, and file explorer
- **Nerd Font icons** throughout the interface

### ⚡ **Development Powerhouse**
- **Modern LSP setup** using Neovim 0.11+ APIs and Mason
- **Intelligent completion** with blink.cmp and multiple sources
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
- **Automatic file templates** for Python, Shell, and Lua scripts
- **TODO highlighting** and project-wide search

## 📁 **Project Structure**

```
kickstart.nvim/
├── init.lua                          # Main configuration entry point
├── KEYBINDINGS.md                   # Complete keybinding reference
├── MIGRATION.md                     # Keybinding migration guide
├── lua/
│   ├── templates.lua                # File template definitions & logic
│   ├── custom/                      # Custom configuration modules
│   │   ├── transparency.lua         # Transparency management module
│   │   ├── config/
│   │   │   └── keymaps.lua         # 🔧 Consolidated LSP & shared keymaps
│   │   ├── utils/
│   │   │   └── plugin-loader.lua   # Enhanced plugin loading system
│   │   └── plugins/                 # Modular plugin organization
│   │       ├── init.lua            # Plugin loader entry point
│   │       ├── lsp/                # Language Server Protocol
│   │       │   └── mason.lua       # LSP server installer
│   │       ├── ui/                 # User Interface
│   │       │   ├── colorscheme.lua # Rose Pine theme
│   │       │   ├── bufferline.lua  # Tab/buffer management
│   │       │   ├── icons.lua       # File type icons
│   │       │   ├── fidget.lua      # LSP progress indicator
│   │       │   └── which-key.lua   # Keymap discovery
│   │       ├── editor/             # Editor Enhancements
│   │       │   ├── telescope.lua   # 🔍 Consolidated telescope keymaps
│   │       │   ├── treesitter.lua  # Syntax highlighting
│   │       │   ├── nvim-tree.lua   # File explorer
│   │       │   ├── autopairs.lua   # Smart bracket pairing
│   │       │   ├── mini.lua        # Mini.nvim modules
│   │       │   └── guess-indent.lua # Auto-detect indentation
│   │       └── tools/              # Development Tools
│   │           ├── git.lua         # Git integration
│   │           ├── gitsigns.lua    # Git signs in gutter
│   │           ├── undotree.lua    # Undo history
│   │           ├── todo-comments.lua # TODO highlighting
│   │           └── misc.lua        # Utility plugins
│   └── kickstart/                   # Original kickstart components
│       └── plugins/                 # Additional kickstart plugins
└── INSTALL.md                       # Configuration-specific setup
```

## 🚀 **Quick Start**

**Requirements:** Neovim 0.11.0+ and dependencies listed in [README.md](README.md).

**Installation:** Use this repository instead of standard kickstart.nvim. See [INSTALL.md](INSTALL.md) for configuration-specific setup.

## ⌨️ **Key Bindings**

> **Note:** All keybindings have been consolidated to eliminate conflicts. LSP and Telescope bindings are now managed in dedicated modules for consistency.

📋 **[Complete Keybinding Reference →](KEYBINDINGS.md)**  
🔄 **[Migration Guide →](MIGRATION.md)** (if upgrading from previous version)

### Core Navigation
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>` | Space | Leader key |
| `<C-s>` | Save | Save current file |
| `<C-n>` | File Tree | Toggle nvim-tree |
| `<leader>e` | Focus Tree | Focus file explorer |
| `<Esc>` | Clear Search | Remove search highlights |

### LSP Navigation (via Telescope)
| Key | Action | Description |
|-----|--------|-------------|
| `gd` | Go to Definition | Jump to symbol definition |
| `gr` | Go to References | Show all symbol references |
| `gi` | Go to Implementation | Jump to implementation |
| `gt` | Go to Type Definition | Jump to type definition |
| `gD` | Go to Declaration | Jump to symbol declaration |
| `K` | Hover Documentation | Show symbol documentation |

### LSP Actions
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>rn` | Rename Symbol | Rename symbol across project |
| `<leader>ca` | Code Action | Show available code actions |
| `<leader>ds` | Document Symbols | Browse document symbols |
| `<leader>ws` | Workspace Symbols | Browse workspace symbols |
| `<leader>pm` | Diagnostic Float | Show diagnostic details |
| `<leader>f` | Format Buffer | Format current buffer |

### Telescope Search (Primary)
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>sf` | Search Files | Find files in project |
| `<leader>sg` | Search by Grep | Live grep search |
| `<leader>sw` | Search Word | Search current word |
| `<leader>sh` | Search Help | Search help documentation |
| `<leader>sk` | Search Keymaps | Browse all keybindings |
| `<leader>ss` | Search Select | Telescope picker menu |
| `<leader>sd` | Search Diagnostics | Browse LSP diagnostics |
| `<leader>sr` | Search Resume | Resume last telescope search |
| `<leader>s.` | Search Recent | Recently opened files |
| `<leader><leader>` | Find Buffers | Browse open buffers |

### Telescope Search (Advanced)
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>/` | Buffer Search | Fuzzy search in current buffer |
| `<leader>s/` | Open Files Search | Search in currently open files |
| `<leader>sn` | Neovim Config | Search Neovim configuration |

### Telescope Legacy Support
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>pf` | Find Files | Legacy: same as `<leader>sf` |
| `<C-p>` | Git Files | Search git-tracked files |
| `<leader>fw` | Live Grep | Legacy: same as `<leader>sg` |
| `<leader>fb` | Find Buffers | Legacy: same as `<leader><leader>` |
| `<leader>fr` | Recent Files | Legacy: same as `<leader>s.` |
| `<leader>fh` | Help Tags | Legacy: same as `<leader>sh` |

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

> **Important:** Keybindings have been consolidated to eliminate conflicts.

**For LSP keybindings:** Edit `lua/custom/config/keymaps.lua` - this module contains all LSP-related keymaps and is automatically loaded when LSP servers attach.

**For Telescope keybindings:** Edit `lua/custom/plugins/editor/telescope.lua` - all telescope keybindings are managed here to avoid duplication.

**For plugin-specific bindings:** Edit individual plugin files in their respective categories.

**Migration Notes:**
- Duplicate keybindings between `init.lua` and custom modules have been removed
- LSP keybindings now use a consistent pattern (`g*` for navigation, `<leader>*` for actions)
- All telescope functions use telescope for better UX (fuzzy finding, preview, etc.)
- Legacy keybindings are preserved for backward compatibility

### Adding File Templates

The template system uses a dedicated `lua/templates.lua` module for easy maintenance and extension.

**Supported Templates:** Python (`.py`), Shell (`.sh`), Lua (`.lua`)

**To add a new template:**

1. Edit `lua/templates.lua` and add your template to the `M.templates` table:

```lua
-- Example: Adding a JavaScript template
javascript = {
  "#!/usr/bin/env node",
  "// $Id$",
  "// File: {{ filename }}",
  "",
  "",
  "",
  "// vim:syntax=javascript",
  "// vim:sw=2:softtabstop=2:expandtab",
},
```

2. **That's it!** The template system automatically:
   - Detects the new template
   - Generates autocmd patterns (`*.js` in this example)
   - Inserts templates when creating new files

**Template Features:**
- ✅ **Automatic insertion** on `BufNewFile` for new files only
- ✅ **Smart cursor positioning** at line 4 for immediate editing
- ✅ **Insert mode activation** for seamless workflow
- ✅ **Extensible design** - just add templates and they work!

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

**Transparency not working?**
- Check terminal true color support  
- For tmux users: see [INSTALL.md](INSTALL.md) tmux configuration

**For other issues**, see [README.md](README.md) troubleshooting and run `:checkhealth`.

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
