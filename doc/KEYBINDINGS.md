# Keybinding Reference

> **Comprehensive guide to all keybindings in this Neovim configuration**

## 🚀 Quick Reference

### Most Used Keybindings
| Key | Action | Context |
|-----|--------|---------|
| `<leader>sf` | Search Files | Telescope |
| `<leader>sg` | Search by Grep | Telescope |
| `gd` | Go to Definition | LSP |
| `gr` | Go to References | LSP |
| `K` | Hover Documentation | LSP |
| `<leader>rn` | Rename Symbol | LSP |
| `<leader>ca` | Code Action | LSP |
| `<leader><leader>` | Find Buffers | Telescope |

## 📋 Complete Keybinding List

### Core Editor
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>` | Space | Leader key |
| `<C-s>` | Save File | Save current buffer |
| `<Esc>` | Clear Search | Remove search highlights |
| `<C-h/j/k/l>` | Window Navigation | Move between splits |
| `<Esc><Esc>` | Exit Terminal | Exit terminal mode |

### LSP (Language Server Protocol)

#### Navigation (with Telescope integration)
| Key | Action | Description |
|-----|--------|-------------|
| `gd` | Go to Definition | Jump to symbol definition |
| `gr` | Go to References | Show all references with preview |
| `gi` | Go to Implementation | Jump to implementation |
| `gt` | Go to Type Definition | Jump to type definition |
| `gD` | Go to Declaration | Jump to symbol declaration |

#### Actions
| Key | Action | Description |
|-----|--------|-------------|
| `K` | Hover Documentation | Show symbol documentation |
| `<leader>rn` | Rename Symbol | Rename symbol across project |
| `<leader>ca` | Code Action | Show available code actions |
| `<leader>ds` | Document Symbols | Browse current file symbols |
| `<leader>ws` | Workspace Symbols | Browse all project symbols |
| `<leader>pm` | Diagnostic Float | Show diagnostic details |
| `<leader>q` | Quickfix List | Open diagnostic quickfix list |
| `<leader>f` | Format Buffer | Format current buffer |

### Telescope (Fuzzy Finder)

#### Primary Search Functions
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>sf` | Search Files | Find files in project |
| `<leader>sg` | Search by Grep | Live grep search across project |
| `<leader>sw` | Search Word | Search current word under cursor |
| `<leader>sh` | Search Help | Search Neovim help documentation |
| `<leader>sk` | Search Keymaps | Browse all defined keybindings |
| `<leader>ss` | Search Select | Open Telescope picker menu |
| `<leader>sd` | Search Diagnostics | Browse LSP diagnostics |
| `<leader>sr` | Search Resume | Resume last telescope search |
| `<leader>s.` | Search Recent | Recently opened files |
| `<leader><leader>` | Find Buffers | Browse currently open buffers |

#### Advanced Search
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>/` | Buffer Search | Fuzzy search within current buffer |
| `<leader>s/` | Open Files Search | Search text in currently open files |
| `<leader>sn` | Neovim Config | Search Neovim configuration files |

#### Legacy Support (Backwards Compatibility)
| Key | Action | Equivalent To |
|-----|--------|---------------|
| `<leader>pf` | Find Files | `<leader>sf` |
| `<C-p>` | Git Files | Search git-tracked files only |
| `<leader>fw` | Live Grep | `<leader>sg` |
| `<leader>fb` | Find Buffers | `<leader><leader>` |
| `<leader>fr` | Recent Files | `<leader>s.` |
| `<leader>fh` | Help Tags | `<leader>sh` |

### Git Integration
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>gs` | Git Status | Open fugitive status window |
| `<leader>gc` | Git Commit | Create new git commit |
| `<leader>gd` | Git Diff | Show git diff for current file |

### File Explorer (nvim-tree)
| Key | Action | Description |
|-----|--------|-------------|
| `<C-n>` | Toggle Tree | Toggle file explorer visibility |
| `<leader>e` | Focus Tree | Focus file explorer window |
| `<leader>ef` | Find File | Find current file in tree |

### Transparency Management
| Command | Action | Description |
|---------|--------|-------------|
| `:TransparentToggle` | Toggle | Switch transparency on/off |
| `:TransparentOn` | Enable | Turn on transparency |
| `:TransparentOff` | Disable | Turn off transparency |

## 🔧 Which-Key Groups

The configuration organizes keybindings into logical groups for better discoverability:

| Prefix | Group | Contents |
|--------|-------|----------|
| `<leader>s` | **[S]earch** | All Telescope search functions |
| `<leader>f` | **[F]ind (Legacy)** | Backwards-compatible search bindings |
| `<leader>p` | **[P]roject** | Project-related functions |
| `<leader>c` | **[C]ode** | Code actions and LSP functions |
| `<leader>d` | **[D]ocument** | Document-level operations |
| `<leader>w` | **[W]orkspace** | Workspace-level operations |
| `<leader>r` | **[R]ename** | Symbol renaming |
| `<leader>t` | **[T]oggle** | Toggle various features |
| `<leader>h` | **Git [H]unk** | Git hunk operations |

## 🚨 Migration Notes

### What Changed
1. **Eliminated Duplicates**: Removed duplicate telescope keybindings from `init.lua`
2. **Consolidated LSP**: All LSP keybindings moved to `lua/custom/config/keymaps.lua`
3. **Consistent Patterns**: LSP navigation uses `g*`, actions use `<leader>*`
4. **Telescope Integration**: All LSP navigation now uses Telescope for better UX

### Removed Conflicts
- ✅ `<leader>dd` (duplicate hover) → Use `K` instead
- ✅ `grn` vs `<leader>rn` (rename) → Standardized on `<leader>rn`
- ✅ Multiple telescope keybinding definitions → Single source in telescope plugin

### Legacy Support
All previously working keybindings are still available through the legacy support system.

## 📁 Configuration Files

| File | Purpose |
|------|---------|
| `lua/custom/config/keymaps.lua` | LSP and shared keybindings |
| `lua/custom/plugins/editor/telescope.lua` | All Telescope keybindings |
| `init.lua` | Core editor keybindings and integration |

## 🔍 Discovering Keybindings

1. **In Neovim**: Press `<leader>sk` to search all keybindings with Telescope
2. **Which-Key**: Press `<leader>` and wait to see available options
3. **This Document**: Reference this file for complete listings
4. **Help**: Use `:help key-notation` for key syntax explanation

## 🎯 Best Practices

### Learning the Keybindings
1. Start with the "Most Used" section above
2. Use `<leader>sk` regularly to discover keybindings
3. Practice the LSP navigation keys (`gd`, `gr`, `gi`, `gt`)
4. Remember: `g*` for navigation, `<leader>*` for actions

### Customization
- **LSP keybindings**: Edit `lua/custom/config/keymaps.lua`
- **Telescope keybindings**: Edit `lua/custom/plugins/editor/telescope.lua`
- **Which-Key groups**: Modify the `spec` table in `init.lua`

### Avoiding Conflicts
- Check existing keybindings with `<leader>sk` before adding new ones
- Follow the established patterns (`g*` for navigation, `<leader>*` for actions)
- Use Which-Key groups to organize related functions

---

*This keybinding reference is automatically maintained alongside the configuration. Last updated: keybinding consolidation refactor.*