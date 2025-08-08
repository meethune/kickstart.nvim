# Installation Guide

## Prerequisites

### Required Dependencies

These tools are **essential** for the configuration to function properly:

#### Core Requirements
- **Neovim 0.11.0+** - This configuration uses modern Neovim 0.11+ APIs
- **Git** - Required by lazy.nvim for plugin management
- **Make** - Required for building native extensions
- **unzip** - Required for extracting plugin archives
- **curl** - Required for downloading resources

#### Search & Navigation
- **ripgrep** (`rg`) - Required for Telescope file searching and live grep

#### Compiler Toolchain
- **C compiler** (gcc, clang, or equivalent) - Required for TreeSitter parsers and native plugins

### Installation Commands by Platform

#### Ubuntu/Debian
```bash
# Update package manager
sudo apt update

# Install core dependencies
sudo apt install neovim git make unzip curl ripgrep build-essential

# Install Neovim 0.11+ (if not available in repos)
# Option 1: From unstable PPA
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt update
sudo apt install neovim

# Option 2: Download latest release
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz
sudo ln -sf /opt/nvim-linux64/bin/nvim /usr/local/bin/
```

#### Arch Linux
```bash
sudo pacman -S neovim git make unzip curl ripgrep base-devel
```

#### Fedora/RHEL
```bash
sudo dnf install neovim git make unzip curl ripgrep gcc gcc-c++
```

#### macOS
```bash
# Using Homebrew
brew install neovim git make unzip curl ripgrep

# Using MacPorts
sudo port install neovim git make unzip curl ripgrep
```

#### Windows
```powershell
# Using Chocolatey
choco install neovim git make unzip curl ripgrep mingw

# Using Scoop
scoop install neovim git make unzip curl ripgrep gcc
```

## Optional Dependencies

These enhance functionality for specific languages and features:

### Development Languages

#### Node.js Development
```bash
# Ubuntu/Debian
sudo apt install nodejs npm

# Arch Linux
sudo pacman -S nodejs npm

# macOS
brew install node npm

# Windows
choco install nodejs npm
```

#### Python Development
```bash
# Ubuntu/Debian
sudo apt install python3 python3-pip python3-venv

# Arch Linux
sudo pacman -S python python-pip

# macOS
brew install python

# Windows
choco install python pip
```

#### Rust Development
```bash
# All platforms
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source ~/.cargo/env
```

#### Go Development
```bash
# Ubuntu/Debian
sudo apt install golang-go

# Arch Linux
sudo pacman -S go

# macOS
brew install go

# Windows
choco install golang
```

### Enhanced Tools

#### File Navigation (Recommended)
```bash
# fd - Alternative to find, enhances Telescope
# Ubuntu/Debian
sudo apt install fd-find

# Arch Linux
sudo pacman -S fd

# macOS
brew install fd

# Windows
choco install fd
```

#### TreeSitter CLI (For Custom Grammars)
```bash
npm install -g tree-sitter-cli
```

#### Code Formatters
```bash
# Lua formatter
cargo install stylua

# Python formatters
pip install black isort

# JavaScript/TypeScript formatter
npm install -g prettier

# Multiple language formatter
npm install -g @fsouza/prettierd
```

### Terminal Enhancements

#### Font Requirements
- **Nerd Font** - Required for proper icon display
  - Download from: https://www.nerdfonts.com/
  - Recommended: JetBrains Mono Nerd Font, Fira Code Nerd Font

#### Tmux Configuration (If Using Tmux)
Add to `~/.tmux.conf` for proper true color support:
```bash
# For newer tmux versions (3.2+)
set-option -a terminal-features 'screen-256color:RGB'

# For older tmux versions
# set-option -a terminal-overrides 'screen-256color:Tc'
```

## Installation Process

### 1. Backup Existing Configuration
```bash
# Backup your current Neovim config
mv ~/.config/nvim ~/.config/nvim.backup.$(date +%Y%m%d_%H%M%S)

# Backup existing plugins
mv ~/.local/share/nvim ~/.local/share/nvim.backup.$(date +%Y%m%d_%H%M%S)
```

### 2. Install This Configuration
```bash
# Clone this configuration
git clone <your-repo-url> ~/.config/nvim

# Or copy the kickstart.nvim directory
cp -r /path/to/kickstart.nvim ~/.config/nvim
```

### 3. First Launch
```bash
# Start Neovim - plugins will install automatically
nvim

# Or start with a specific file
nvim init.lua
```

### 4. Post-Installation Setup

#### Install LSP Servers
The configuration will prompt you to install LSP servers. Commonly needed servers:
```vim
# In Neovim, run:
:Mason

# Install servers for your languages:
# - lua_ls (Lua)
# - pyright (Python)  
# - rust_analyzer (Rust)
# - tsserver (JavaScript/TypeScript)
```

#### Verify Installation
```vim
# Check overall health
:checkhealth

# Check specific components
:checkhealth kickstart
:checkhealth mason
:checkhealth telescope
```

## Troubleshooting

### Common Issues

#### "No LSP servers found"
- Run `:Mason` and install language servers
- Ensure the LSP server is in your PATH

#### "Icons not displaying"
- Install a Nerd Font
- Set `vim.g.have_nerd_font = true` in init.lua

#### "Telescope not finding files"
- Install `ripgrep` (rg)
- Install `fd-find` for enhanced search

#### "True colors not working"
- Check terminal true color support
- Configure tmux properly (see above)
- Ensure `$TERM` supports true colors

#### "Plugins not loading"
- Check `:Lazy` for plugin status
- Run `:Lazy sync` to update/install plugins
- Check `:messages` for error details

### Health Check Interpretation

After installation, run `:checkhealth` and review:

- ✅ **OK** - Everything working correctly
- ⚠️ **WARNING** - Optional feature unavailable
- ❌ **ERROR** - Required component missing

**Focus on fixing errors first**, warnings are typically for optional features.

## Performance Tips

### Faster Startup
- Use `lazy = true` in plugin specs for non-essential plugins
- Minimize plugins loaded at startup
- Use `cmd`, `keys`, `ft` for lazy loading

### Better Terminal Experience
- Use a modern terminal emulator (Alacritty, Kitty, WezTerm)
- Enable true color support
- Configure proper font rendering

### Network Performance
- Use local mirrors for Mason package installs
- Configure git to use SSH for better authentication

## Uninstallation

To remove this configuration:
```bash
# Remove configuration
rm -rf ~/.config/nvim

# Remove plugins and data
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim

# Restore backup (if exists)
mv ~/.config/nvim.backup.YYYYMMDD_HHMMSS ~/.config/nvim
```

## Support

If you encounter issues:

1. **Check health**: `:checkhealth`
2. **Review logs**: `:messages` and `:Lazy log`
3. **Verify dependencies**: Ensure all required tools are installed
4. **Check versions**: Ensure Neovim 0.11.0+ is installed
5. **Search documentation**: Review the generated documentation files

For additional help, consult the original kickstart.nvim documentation and Neovim's built-in help system (`:help`).