return {
   'neovim/nvim-lspconfig',
   event = { 'BufReadPre', 'BufNewFile' },
   dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      { 'antosha417/nvim-lsp-file-operations', config = true },
   },
   config = function()
      local cmp_nvim_lsp = require 'cmp_nvim_lsp'
      local Snacks = require 'snacks'
      local keymap = vim.keymap

      vim.api.nvim_create_autocmd('LspAttach', {
         group = vim.api.nvim_create_augroup('UserLspConfig', {}),
         callback = function(ev)
            local opts = { buffer = ev.buf, silent = true }

            opts.desc = 'Show LSP references'
            keymap.set('n', 'gR', function() Snacks.picker.lsp_references() end, opts)

            opts.desc = 'Go to declaration'
            keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)

            opts.desc = 'Show LSP definitions'
            keymap.set('n', 'gd', function() Snacks.picker.lsp_definitions() end, opts)

            opts.desc = 'Show LSP implementations'
            keymap.set('n', 'gi', function() Snacks.picker.lsp_implementations() end, opts)

            opts.desc = 'Show LSP type definitions'
            keymap.set('n', 'gt', function() Snacks.picker.lsp_type_definitions() end, opts)

            opts.desc = 'See available code actions'
            keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)

            opts.desc = 'Smart rename'
            keymap.set('n', '<leader>grn', vim.lsp.buf.rename, opts)

            opts.desc = 'Show buffer diagnostics'
            keymap.set('n', '<leader>D', function() Snacks.picker.diagnostics({ filter = { buf = 0 } }) end, opts)

            opts.desc = 'Show line diagnostics'
            keymap.set('n', '<leader>d', vim.diagnostic.open_float, opts)

            opts.desc = 'Go to previous diagnostic'
            keymap.set('n', '[d', function()
               vim.diagnostic.jump { count = -1 }
            end, opts)

            opts.desc = 'Go to next diagnostic'
            keymap.set('n', ']d', function()
               vim.diagnostic.jump { count = 1 }
            end, opts)

            opts.desc = 'Show documentation for what is under cursor'
            keymap.set('n', 'K', vim.lsp.buf.hover, opts)

            opts.desc = 'Restart LSP'
            keymap.set('n', '<leader>grs', ':LspRestart<CR>', opts)
         end,
      })

      -- apply cmp capabilities to all LSP servers
      vim.lsp.config('*', {
         capabilities = cmp_nvim_lsp.default_capabilities(),
      })

      -- enable all servers installed by mason-lspconfig
      vim.lsp.enable {
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
      }

      -- diagnostics config
      vim.diagnostic.config {
         signs = {
            text = {
               [vim.diagnostic.severity.ERROR] = ' ',
               [vim.diagnostic.severity.WARN] = ' ',
               [vim.diagnostic.severity.HINT] = '󰠠 ',
               [vim.diagnostic.severity.INFO] = ' ',
            },
         },
         virtual_lines = {
            current_line = true,
         },
      }
   end,
}
