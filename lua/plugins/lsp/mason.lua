return {
   'williamboman/mason.nvim',
   dependencies = {
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
   },
   config = function()
      require('mason').setup {
         ui = {
            icons = {
               package_installed = '✓',
               package_pending = '➜',
               package_uninstalled = '✗',
            },
         },
      }

      require('mason-lspconfig').setup {
         ensure_installed = {
            'ts_ls',
            'gopls',
            'clangd',
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

      require('mason-tool-installer').setup {
         ensure_installed = {
            { 'prettier', version = '3.8.1' },
            { 'stylua', version = '2.0.1' },
            { 'isort', version = '6.0.1' },
            { 'black', version = '25.1.0' },
            { 'pylint', version = '3.3.6' },
            { 'eslint_d', version = '14.3.0' },
         },
      }
   end,
}
