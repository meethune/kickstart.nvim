-- LSP server configurations using Neovim 0.11+ APIs
return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    'hrsh7th/cmp-nvim-lsp',
  },
  config = function()
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    
    -- Use centralized keymap configuration
    local keymaps = require('custom.config.keymaps')
    local function setup_keymaps(client, bufnr)
      keymaps.setup_lsp_keymaps(bufnr)
    end

    -- Modern vim.lsp.config() approach for Neovim 0.11+
    
    -- Lua Language Server (optimized for Neovim)
    vim.lsp.config('lua_ls', {
      cmd = { 'lua-language-server' },
      filetypes = { 'lua' },
      root_markers = { '.luarc.json', '.luarc.jsonc', '.luacheckrc', '.stylua.toml', 'stylua.toml', 'selene.toml', 'selene.yml' },
      capabilities = capabilities,
      on_attach = setup_keymaps,
      settings = {
        Lua = {
          runtime = { version = 'LuaJIT' },
          diagnostics = { globals = {'vim'} },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false,
          },
          telemetry = { enable = false },
        },
      },
    })

    -- Python Language Server
    vim.lsp.config('pyright', {
      cmd = { 'pyright-langserver', '--stdio' },
      filetypes = { 'python' },
      root_markers = { 'pyproject.toml', 'setup.py', 'setup.cfg', 'requirements.txt', 'Pipfile', 'pyrightconfig.json' },
      capabilities = capabilities,
      on_attach = setup_keymaps,
      settings = {
        python = {
          analysis = {
            autoSearchPaths = true,
            useLibraryCodeForTypes = true,
            diagnosticMode = 'workspace',
          },
        },
      },
    })

    -- Rust Language Server
    vim.lsp.config('rust_analyzer', {
      cmd = { 'rust-analyzer' },
      filetypes = { 'rust' },
      root_markers = { 'Cargo.toml', 'rust-project.json' },
      capabilities = capabilities,
      on_attach = setup_keymaps,
      settings = {
        ['rust-analyzer'] = {
          cargo = {
            allFeatures = true,
            loadOutDirsFromCheck = true,
            runBuildScripts = true,
          },
          -- Add clippy lints for Rust.
          checkOnSave = {
            allFeatures = true,
            command = 'clippy',
            extraArgs = { '--no-deps' },
          },
          procMacro = {
            enable = true,
            ignored = {
              ['async-trait'] = { 'async_trait' },
              ['napi-derive'] = { 'napi' },
              ['async-recursion'] = { 'async_recursion' },
            },
          },
        },
      },
    })

    -- Enable all configured LSP servers
    vim.lsp.enable({ 'lua_ls', 'pyright', 'rust_analyzer' })
    
    -- Add a command to restart LSP servers
    vim.api.nvim_create_user_command('LspRestart', function()
      vim.lsp.enable({ 'lua_ls', 'pyright', 'rust_analyzer' }, false)
      vim.lsp.enable({ 'lua_ls', 'pyright', 'rust_analyzer' }, true)
    end, { desc = 'Restart LSP servers' })
    
    -- Check LSP status command
    vim.api.nvim_create_user_command('LspStatus', function()
      local servers = { 'lua_ls', 'pyright', 'rust_analyzer' }
      for _, server in ipairs(servers) do
        local enabled = vim.lsp.is_enabled() and vim.lsp.is_enabled()[server] or false
        print(server .. ': ' .. (enabled and 'enabled' or 'disabled'))
      end
    end, { desc = 'Show LSP server status' })
  end,
}