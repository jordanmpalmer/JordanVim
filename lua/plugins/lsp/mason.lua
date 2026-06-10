return {
   'williamboman/mason.nvim',
   dependencies = {
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
   },
   config = function()
      -- import mason
      local mason = require 'mason'

      -- import mason-lspconfig
      local mason_lspconfig = require 'mason-lspconfig'

      local mason_tool_installer = require 'mason-tool-installer'

      -- enable mason and configure icons
      mason.setup {
         ui = {
            icons = {
               package_installed = '✓',
               package_pending = '➜',
               package_uninstalled = '✗',
            },
         },
      }

      mason_lspconfig.setup {
         -- list of servers for mason to install
         ensure_installed = {
            'ts_ls',
            'gopls',
            'html',
            'cssls',
            'tailwindcss',
            'terraformls',
            'svelte',
            'lua_ls',
            'graphql',
            'emmet_ls',
            'prismals',
            'pyright',
         },
      }

      mason_tool_installer.setup {
         ensure_installed = {
            { 'prettier', version = '3.8.1' }, -- prettier formatter (2026-01-21)
            { 'stylua', version = '2.0.1' }, -- lua formatter
            { 'isort', version = '6.0.1' }, -- python formatter
            { 'black', version = '25.1.0' }, -- python formatter
            { 'pylint', version = '3.3.6' }, -- python linter
            { 'eslint_d', version = '14.3.0' }, -- js linter (2024-12-19)
         },
      }
   end,
}
