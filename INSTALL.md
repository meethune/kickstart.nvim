# Installation Guide

## Prerequisites

**⚠️ Important:** This configuration requires **Neovim 0.11.0+** for modern LSP APIs.

**Base Dependencies:** Follow the complete installation instructions in [README.md](README.md) for all standard dependencies (git, make, unzip, ripgrep, etc.).

## Unique Requirements

### Neovim Version
This configuration uses modern Neovim 0.11+ APIs that are not available in older versions:
```bash
# Verify version after installation
nvim --version
```

### Terminal Enhancements

#### Tmux Configuration (If Using Tmux)
For proper transparency and true color support, add to `~/.tmux.conf`:
```bash
# For newer tmux versions (3.2+)
set-option -a terminal-features 'screen-256color:RGB'

# For older tmux versions
# set-option -a terminal-overrides 'screen-256color:Tc'
```

## Installation Process

### 1. Install This Configuration
Follow the standard kickstart.nvim installation process from [README.md](README.md), using this repository instead:

```bash
# Backup existing config (if any)
mv ~/.config/nvim ~/.config/nvim.backup

# Install this configuration  
git clone <your-repo-url> ~/.config/nvim

# Start Neovim - plugins install automatically
nvim
```

### 2. Post-Installation Setup

#### Configure Transparency (Optional)
Transparency is enabled by default. To modify:
```vim
# Toggle transparency
:TransparentToggle

# Or modify in init.lua:
require('custom.transparency').setup({
  default_transparent = false  -- Change to true for transparent by default
})
```

## Configuration-Specific Setup

### LSP Servers
Install language servers through Mason:
```vim
:Mason
```

### Health Check
Verify everything works:
```vim
:checkhealth
:checkhealth kickstart
```

## Troubleshooting

**Transparency not working?**
- Check terminal true color support
- Configure tmux properly (see above)

**For other issues** (LSP, plugins, icons), see [README.md](README.md) troubleshooting section and run `:checkhealth`.

## Unique Features

This configuration adds several enhancements to kickstart.nvim:

- **Transparency management** with terminal background matching
- **Modular plugin architecture** with categorical organization  
- **Neovim 0.11+ modern APIs** for improved performance
- **File templates** with automatic shebangs and headers for Python/shell scripts
- **Enhanced keymaps** and centralized configuration

See [README_CUSTOM.md](README_CUSTOM.md) for complete feature overview.