# Keybinding Migration Guide

> **Important updates to keybinding organization - please read if upgrading**

## 🚨 Breaking Changes Summary

This update consolidates and organizes keybindings to eliminate conflicts and improve consistency. **All functionality remains available**, but some keybindings have been reorganized.

## 📋 What Changed

### ✅ Resolved Conflicts
| Issue | Before | After | Status |
|-------|--------|-------|--------|
| **Duplicate Hover** | `<leader>dd` + `K` | `K` only | ✅ Fixed |
| **Rename Conflict** | `grn` + `<leader>rn` | `<leader>rn` only | ✅ Fixed |
| **Telescope Duplication** | Multiple definitions | Single source | ✅ Fixed |

### 🔄 Relocated Keybindings
| Component | Old Location | New Location |
|-----------|--------------|--------------|
| **LSP Keybindings** | `init.lua` | `lua/custom/config/keymaps.lua` |
| **Telescope Keybindings** | `init.lua` + plugin file | `lua/custom/plugins/editor/telescope.lua` |

## 🔧 Action Required

### For Most Users: **No Action Needed**
- All existing keybindings continue to work
- Legacy support preserves backwards compatibility
- Enhanced functionality through Telescope integration

### For Advanced Users: **Review Customizations**
If you've modified keybindings in `init.lua`, consider moving them to the appropriate modules:

1. **LSP customizations** → `lua/custom/config/keymaps.lua`
2. **Telescope customizations** → `lua/custom/plugins/editor/telescope.lua`

## 📖 Migration Details

### LSP Keybinding Changes

#### Navigation (Enhanced with Telescope)
| Function | Old Key | New Key | Enhancement |
|----------|---------|---------|-------------|
| Go to Definition | `gd` | `gd` | ✅ Now uses Telescope |
| Go to References | `gr` | `gr` | ✅ Now uses Telescope |
| Go to Implementation | `gri` | `gi` | ✅ Shorter key |
| Go to Type Definition | `grt` | `gt` | ✅ Shorter key |
| Document Symbols | `gO` | `<leader>ds` | ✅ More logical grouping |
| Workspace Symbols | `gW` | `<leader>ws` | ✅ More logical grouping |

#### Actions (Standardized)
| Function | Old Key | New Key | Status |
|----------|---------|---------|--------|
| Hover Documentation | `<leader>dd` + `K` | `K` | ✅ Simplified |
| Rename Symbol | `grn` + `<leader>rn` | `<leader>rn` | ✅ Consistent |
| Code Action | `gra` | `<leader>ca` | ✅ Logical prefix |

### Telescope Organization

#### Primary Search (Recommended)
| Function | Primary Key | Legacy Key | Description |
|----------|-------------|------------|-------------|
| Find Files | `<leader>sf` | `<leader>pf` | Search [F]iles |
| Live Grep | `<leader>sg` | `<leader>fw` | Search by [G]rep |
| Find Buffers | `<leader><leader>` | `<leader>fb` | Quick buffer access |
| Recent Files | `<leader>s.` | `<leader>fr` | Search recent |
| Help Tags | `<leader>sh` | `<leader>fh` | Search [H]elp |

## 🎯 Learning the New Organization

### Logical Grouping
1. **`g*` keys** = Navigation (go to definition, references, etc.)
2. **`<leader>s*` keys** = Search functions (files, grep, help, etc.)
3. **`<leader>c*` keys** = Code actions (rename, actions, etc.)
4. **`<leader>d*` keys** = Document operations
5. **`<leader>w*` keys** = Workspace operations

### Discovery Tools
- **`<leader>sk`** → Browse all keybindings with Telescope
- **`<leader>`** + wait → Which-Key popup shows available options
- **See [KEYBINDINGS.md](KEYBINDINGS.md)** → Complete reference

## 🔍 Troubleshooting

### "My custom keybinding stopped working"
1. **Check if it conflicts** with new organization using `<leader>sk`
2. **Move to appropriate module**:
   - LSP-related → `lua/custom/config/keymaps.lua`
   - Telescope-related → `lua/custom/plugins/editor/telescope.lua`
   - General → Add to `init.lua` or create new module

### "Custom plugins not loading (nvim-tree, etc.)"
1. **Check custom plugin import** is enabled in `init.lua:993`:
   ```lua
   { import = 'custom.plugins' },  -- Should NOT be commented out
   ```
2. **Verify with `:Lazy`** to see plugin installation status
3. **Remove duplicate plugins** that might conflict with existing definitions

### "I can't find a keybinding"
1. **Use discovery**: Press `<leader>sk` to search all keybindings
2. **Check legacy support**: Many old keys still work under different names
3. **Reference documentation**: See [KEYBINDINGS.md](KEYBINDINGS.md) for complete list

### "Telescope functions look different"
This is expected! LSP navigation now uses Telescope for:
- ✅ **Fuzzy search** in results
- ✅ **Live preview** of definitions/references
- ✅ **Better navigation** with `<C-n>/<C-p>`
- ✅ **Multiple results** handling

## 🏗️ Architecture Benefits

### Before (Problems)
- ❌ Duplicate keybindings in multiple files
- ❌ Inconsistent patterns (`grn` vs `<leader>rn`)
- ❌ LSP navigation without preview
- ❌ No centralized management

### After (Solutions)
- ✅ Single source of truth for each keybinding type
- ✅ Consistent patterns and logical grouping
- ✅ Enhanced UX with Telescope integration
- ✅ Modular organization for easy maintenance

## 📚 Additional Resources

- **[KEYBINDINGS.md](KEYBINDINGS.md)** → Complete keybinding reference
- **[README_CUSTOM.md](../README_CUSTOM.md)** → Updated configuration overview
- **`:help key-notation`** → Neovim key syntax help
- **`<leader>sk`** → Interactive keybinding search

## 🤝 Getting Help

If you encounter issues with the migration:

1. **Check the documentation** linked above
2. **Use built-in discovery** tools (`<leader>sk`, which-key)
3. **Review your customizations** and move them to appropriate modules
4. **Test incrementally** by commenting out custom keybindings and re-adding

---

*Remember: This migration improves organization and eliminates conflicts while preserving all functionality. Take advantage of the enhanced Telescope integration for a better development experience!*