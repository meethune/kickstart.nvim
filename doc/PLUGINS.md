# Plugin Documentation

> **Comprehensive guide to all plugins installed and configured in this Neovim setup**

## 📋 Quick Reference

### Plugin Count: **24 Active Plugins**
- **LSP & Completion**: 7 plugins
- **UI & Interface**: 6 plugins  
- **Editor Enhancement**: 6 plugins
- **Development Tools**: 5 plugins

---

## 🔧 LSP & Completion Plugins

### Language Server Protocol (LSP)

#### [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
**Purpose**: Provides default configurations for language servers  
**Version**: Latest  
**Configuration**: `init.lua:518-741`

- Pre-configured LSP setups for multiple languages
- Requires Neovim 0.11.3+
- Centralized language server configuration repository
- Currently configured: `lua_ls` (Lua Language Server)

#### [folke/lazydev.nvim](https://github.com/folke/lazydev.nvim)
**Purpose**: Enhanced Lua development support  
**Version**: Latest  
**Configuration**: `init.lua:507-515`

- Lazy loading of Neovim Lua libraries
- Intelligent workspace management
- Faster auto-completion for Lua development
- Automatically updates workspace based on `require` statements

#### [mason-org/mason.nvim](https://github.com/mason-org/mason.nvim)
**Purpose**: LSP server, formatter, and tool installer  
**Version**: Latest  
**Configuration**: Managed automatically via dependencies

- Automatic installation of language servers
- Easy management of development tools
- Cross-platform support
- UI for browsing and installing tools (`:Mason`)

#### [mason-org/mason-lspconfig.nvim](https://github.com/mason-org/mason-lspconfig.nvim)
**Purpose**: Bridge between mason.nvim and nvim-lspconfig  
**Version**: Latest  
**Configuration**: `init.lua:727-740`

- Automatic installation of language servers used by lspconfig
- Ensures LSPs are available before configuration
- Simplifies server setup workflow

#### [WhoIsSethDaniel/mason-tool-installer.nvim](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim)
**Purpose**: Automatic tool installation for Mason  
**Version**: Latest  
**Configuration**: `init.lua:725`

- Automatically installs configured tools
- Currently ensures: `stylua` (Lua formatter)
- Reduces manual setup requirements

### Completion & Snippets

#### [saghen/blink.cmp](https://github.com/saghen/blink.cmp)
**Purpose**: High-performance completion engine  
**Version**: 1.*  
**Configuration**: `init.lua:786-885`

- Updates on every keystroke (0.5-4ms async)
- Built-in LSP, path, and snippet support
- Optional Rust fuzzy matcher for "typo resistance"
- Compatible with nvim-cmp sources
- Integrated with signature help

**Sources**: LSP, Path, Snippets, LazyDev

#### [L3MON4D3/LuaSnip](https://github.com/L3MON4D3/LuaSnip)
**Purpose**: Advanced snippet engine  
**Version**: 2.*  
**Configuration**: `init.lua:792-818`

- LSP-style snippet parsing
- Supports VS Code, SnipMate, and Lua snippet formats
- Advanced snippet nodes (function, dynamic, choice)
- Custom snippets loaded from `./lua/snippets`
- Optional jsregexp build for advanced transformations

---

## 🎨 UI & Interface Plugins

### Color Schemes

#### [rose-pine/neovim](https://github.com/rose-pine/neovim)
**Purpose**: Minimalist aesthetic colorscheme  
**Version**: Latest  
**Configuration**: `lua/custom/plugins/ui/colorscheme.lua`

- Three variants: main, moon, dawn
- Transparency support enabled
- Sophisticated color palette ("foam", "iris", "pine")
- "All natural pine, faux fur and soho vibes for the classy minimalist"

**Active Variant**: Main (auto-selected)

#### [folke/tokyonight.nvim](https://github.com/folke/tokyonight.nvim)
**Purpose**: Alternative colorscheme (currently used)  
**Version**: Latest  
**Configuration**: `init.lua:892-906`

- Multiple variants available
- Currently using: `tokyonight-night`
- Disabled italic comments for better readability

### Interface Components

#### [folke/which-key.nvim](https://github.com/folke/which-key.nvim)
**Purpose**: Keymap discovery and help system  
**Version**: Latest  
**Configuration**: `init.lua:367-423`

- Shows available keybindings in popup as you type
- Supports icons and custom formatting
- Organized keybinding groups for better discoverability
- Zero delay configuration for immediate feedback

**Key Groups**: Search, Toggle, Git Hunk, Find, Project, Code, Document, Workspace, Rename

#### [akinsho/bufferline.nvim](https://github.com/akinsho/bufferline.nvim)
**Purpose**: Enhanced buffer/tab management  
**Version**: Latest  
**Configuration**: `lua/custom/plugins/ui/bufferline.lua`

- Slant separator style
- LSP diagnostics integration
- Buffer close icons and actions
- Smart display (hidden when single buffer)

**Keybindings**:
- `<C-j>/<C-k>`: Navigate buffers
- `<leader>bd`: Delete buffer
- `<leader>bo`: Close other buffers

#### [j-hui/fidget.nvim](https://github.com/j-hui/fidget.nvim)
**Purpose**: LSP progress indicator  
**Version**: Latest  
**Configuration**: `lua/custom/plugins/ui/fidget.lua`

- Real-time LSP operation progress
- Non-intrusive spinner display
- Automatic configuration
- Enhances developer workflow awareness

#### [nvim-tree/nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)
**Purpose**: File type icons provider  
**Version**: Latest  
**Configuration**: Shared dependency

- Nerd Font icon support
- File type recognition
- Used by multiple plugins (telescope, nvim-tree, bufferline)
- Conditional loading based on `vim.g.have_nerd_font`

#### [echasnovski/mini.nvim](https://github.com/echasnovski/mini.nvim) (Statusline)
**Purpose**: Modular plugin collection (statusline component)  
**Version**: Latest  
**Configuration**: `init.lua:912-947` & `lua/custom/plugins/editor/mini.lua`

**Active Modules**:
- **mini.statusline**: Custom statusline with icon support
- **mini.ai**: Extended text objects (500 lines scope)
- **mini.surround**: Surround text actions

---

## ✏️ Editor Enhancement Plugins

### File Navigation & Search

#### [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
**Purpose**: Extensible fuzzy finder  
**Version**: 0.1.x  
**Configuration**: `init.lua:433-500` & `lua/custom/plugins/editor/telescope.lua`

- Fuzzy finding across files, git repos, LSP symbols
- Modular and highly customizable
- Built-in support for multiple pickers
- Enhanced with fzf-native for performance

**Dependencies**:
- `nvim-lua/plenary.nvim`: Lua utility functions
- `nvim-telescope/telescope-fzf-native.nvim`: Native FZF sorting
- `nvim-telescope/telescope-ui-select.nvim`: Enhanced UI selection

**Primary Keybindings**:
- `<leader>sf`: Search Files
- `<leader>sg`: Search by Grep  
- `<leader>sw`: Search current Word
- `<leader><leader>`: Find Buffers

#### [nvim-tree/nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)
**Purpose**: File explorer sidebar  
**Version**: Latest  
**Configuration**: `lua/custom/plugins/editor/nvim-tree.lua`

- Tree-style file navigation
- Git integration and highlighting
- Adaptive sizing and customizable view
- Replaces netrw for enhanced file management

**Features**:
- 35px width with adaptive sizing
- Git status indicators
- Custom filters (excludes .git, node_modules)
- Dotfiles visible by default

**Keybindings**:
- `<C-n>`: Toggle tree
- `<leader>e`: Focus tree
- `<leader>ef`: Find current file in tree

### Syntax & Language Support

#### [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
**Purpose**: Advanced syntax highlighting and parsing  
**Version**: Latest  
**Configuration**: `init.lua:949-973` & `lua/custom/plugins/editor/treesitter.lua`

- Tree-sitter library integration
- More precise syntax highlighting than regex-based
- Modular features (highlighting, indentation, folding)
- Auto-installation of language parsers

**Installed Languages**: bash, c, diff, html, lua, luadoc, markdown, markdown_inline, query, vim, vimdoc

**Features**:
- Smart indentation (disabled for Ruby)
- Additional regex highlighting for Ruby
- Automatic parser installation

#### [NMAC427/guess-indent.nvim](https://github.com/NMAC427/guess-indent.nvim)
**Purpose**: Automatic indentation detection  
**Version**: Latest  
**Configuration**: `init.lua:315`

- Automatically detects tabstop and shiftwidth
- Adapts to existing file formatting
- Zero-configuration smart indentation
- Improves code consistency across projects

### Text Objects & Editing

#### [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs) (via custom config)
**Purpose**: Smart bracket and quote pairing  
**Version**: Latest  
**Configuration**: `lua/custom/plugins/editor/autopairs.lua`

- TreeSitter integration for intelligent pairing
- Auto-completion integration
- Context-aware pair insertion
- Customizable for different file types

---

## 🛠️ Development Tools

### Git Integration

#### [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
**Purpose**: Git change indicators and hunk management  
**Version**: Latest  
**Configuration**: `init.lua:340-350` & `lua/custom/plugins/tools/gitsigns.lua`

- Git signs in gutter (add: +, change: ~, delete: _)
- Hunk staging, unstaging, and preview
- Blame information display
- Navigation between changes

**Features**:
- Inline hunk preview
- Word-level diff highlighting
- Quickfix list integration
- Text objects for hunk selection

#### [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive)
**Purpose**: Comprehensive Git integration  
**Version**: Latest  
**Configuration**: `lua/custom/plugins/tools/git.lua`

- Full Git workflow within Neovim
- Git status, commit, push, log operations
- Diff splitting and merge conflict resolution
- Industry-standard Git plugin

**Keybindings**:
- `<leader>gs`: Git Status
- `<leader>gc`: Git Commit
- `<leader>gp`: Git Push
- `<leader>gl`: Git Log
- `<leader>gd`: Git Diff

### Code Quality & Formatting

#### [stevearc/conform.nvim](https://github.com/stevearc/conform.nvim)
**Purpose**: Automatic code formatting  
**Version**: Latest  
**Configuration**: `init.lua:744-783`

- Format on save (configurable per filetype)
- LSP fallback formatting
- Multiple formatter support per language
- Async formatting with timeout handling

**Configured Formatters**:
- Lua: `stylua`
- Disabled for C/C++ (no standardized style)

**Features**:
- 500ms timeout with fallback
- Manual formatting via `<leader>f`
- Notification on errors disabled

#### [folke/todo-comments.nvim](https://github.com/folke/todo-comments.nvim)
**Purpose**: TODO/FIXME/NOTE highlighting  
**Version**: Latest  
**Configuration**: `init.lua:910` & `lua/custom/plugins/tools/todo-comments.lua`

- Highlights TODO, FIXME, HACK, WARN, NOTE comments
- Project-wide search and navigation
- Telescope integration for finding todos
- Signs disabled for cleaner appearance

### Utility Tools

#### [mbbill/undotree](https://github.com/mbbill/undotree)
**Purpose**: Undo history visualization  
**Version**: Latest  
**Configuration**: `lua/custom/plugins/tools/undotree.lua`

- Tree-style undo history display
- Time-based change navigation
- Diff view of changes
- Enhanced undo workflow

**Configuration**:
- Window layout 2 (side-by-side)
- Short indicators enabled
- Auto-focus on toggle

**Keybinding**: `<leader>u`: Toggle Undotree

#### [jamessan/vim-gnupg](https://github.com/jamessan/vim-gnupg)
**Purpose**: GPG file encryption support  
**Version**: Latest  
**Configuration**: `lua/custom/plugins/tools/misc.lua`

- Transparent GPG file editing
- Automatic encryption/decryption
- Security-focused file handling
- Password management workflow

#### [sitiom/nvim-numbertoggle](https://github.com/sitiom/nvim-numbertoggle)
**Purpose**: Smart line numbering  
**Version**: Latest  
**Configuration**: `lua/custom/plugins/tools/misc.lua`

- Automatic relative/absolute number toggling
- Context-aware numbering (relative in normal, absolute in insert)
- Improves navigation workflow
- Zero-configuration smart behavior

#### [simrat39/rust-tools.nvim](https://github.com/simrat39/rust-tools.nvim)
**Purpose**: Enhanced Rust development  
**Version**: Latest  
**Configuration**: `lua/custom/plugins/tools/misc.lua`

- Rust-specific tooling integration
- File-type specific loading (`ft = 'rust'`)
- Enhances rust-analyzer LSP
- Cargo integration and debugging support

---

## 📁 Plugin Organization

### File Structure
```
lua/custom/plugins/
├── ui/                    # User Interface
│   ├── colorscheme.lua   # Rose Pine theme
│   ├── bufferline.lua    # Buffer management
│   ├── fidget.lua        # LSP progress
│   ├── icons.lua         # File type icons
│   └── which-key.lua     # Keymap discovery
├── editor/               # Editor Enhancements  
│   ├── telescope.lua     # Fuzzy finder
│   ├── nvim-tree.lua     # File explorer
│   ├── treesitter.lua    # Syntax highlighting
│   ├── autopairs.lua     # Smart pairing
│   ├── mini.lua          # Mini.nvim modules
│   └── guess-indent.lua  # Auto-indentation
├── tools/                # Development Tools
│   ├── git.lua           # Git integration
│   ├── gitsigns.lua      # Git signs
│   ├── undotree.lua      # Undo history
│   ├── todo-comments.lua # TODO highlighting
│   └── misc.lua          # Utility plugins
└── lsp/                  # LSP Configuration
    └── mason.lua         # LSP server management
```

### Loading Strategy
- **Lazy Loading**: Most plugins use event-based or key-based loading
- **Dependencies**: Automatic dependency resolution via lazy.nvim
- **Modular**: Each plugin in its own file for easy maintenance
- **Error Handling**: Plugin loader with fallback and debugging support

## 🔗 External Dependencies

### Required Tools
- **Neovim**: 0.11.0+ required
- **Git**: For version control integration
- **Make**: For building native extensions (telescope-fzf-native)
- **Node.js**: For some LSP servers (when installed)
- **Rust**: For Rust development tools

### Optional Dependencies
- **Nerd Fonts**: For icons (auto-detected via `vim.g.have_nerd_font`)
- **ripgrep**: Enhanced by telescope for faster searching
- **fd**: File finding optimization
- **Clipboard tool**: For system clipboard integration

## 📊 Plugin Performance

### Startup Impact
- **Lazy Loading**: Minimizes startup time impact
- **Event-based**: Plugins load only when needed
- **Conditional**: Some plugins only load with specific conditions

### Memory Usage
- **Modular**: Only active modules consume memory
- **Efficient**: Blink.cmp and telescope optimized for performance
- **Configurable**: Users can disable resource-intensive features

## 🔧 Customization Guide

### Adding New Plugins
1. Create file in appropriate category (`ui/`, `editor/`, `tools/`, `lsp/`)
2. Follow existing patterns for configuration
3. Use lazy loading where appropriate
4. Document keybindings and configuration

### Modifying Existing Plugins
- Edit individual plugin files in `lua/custom/plugins/`
- Maintain compatibility with existing keybindings
- Update this documentation when making significant changes

### Plugin Priorities
- **Colorschemes**: High priority (1000) for early loading
- **LSP**: Medium priority for development workflow
- **UI Components**: Event-based loading for responsiveness
- **Tools**: Lazy loading for optimal startup

---

## 📚 Additional Resources

### Plugin Documentation
- **Lazy.nvim**: [Plugin management system](https://github.com/folke/lazy.nvim)
- **LSP Guide**: `:help lsp` in Neovim
- **TreeSitter**: `:help nvim-treesitter` 
- **Telescope**: `:help telescope.nvim`

### Configuration References
- **[KEYBINDINGS.md](KEYBINDINGS.md)**: Complete keybinding reference
- **[README_CUSTOM.md](../README_CUSTOM.md)**: Configuration overview
- **[MIGRATION.md](MIGRATION.md)**: Upgrade and migration guide

### Community Resources
- Most plugins have active GitHub communities
- Neovim discussions: [GitHub Discussions](https://github.com/neovim/neovim/discussions)
- Plugin-specific documentation linked in each section above

---

*This plugin documentation is maintained alongside the configuration. Last updated: Plugin analysis and documentation generation.*