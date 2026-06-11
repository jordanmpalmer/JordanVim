-- nvim-treesitter: parser installer and manager
-- In nvim 0.12, highlighting/indent are built-in but must be enabled.
return {
   {
      'nvim-treesitter/nvim-treesitter',
      event = { 'BufReadPre', 'BufNewFile' },
      build = ':TSUpdate',
      config = function()
         require('nvim-treesitter.install').install {
            'json',
            'javascript',
            'typescript',
            'tsx',
            'yaml',
            'html',
            'css',
            'prisma',
            'markdown',
            'markdown_inline',
            'svelte',
            'graphql',
            'bash',
            'lua',
            'vim',
            'dockerfile',
            'gitignore',
            'query',
            'vimdoc',
            'c',
            'cpp',
            'go',
            'python',
            'terraform',
         }

         -- Enable treesitter highlighting, indentation, and folding for all buffers with a parser
         vim.api.nvim_create_autocmd('FileType', {
            callback = function(args)
               if pcall(vim.treesitter.start, args.buf) then
                  vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                  vim.wo[0][0].foldmethod = 'expr'
                  vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
               end
            end,
         })
      end,
   },

   -- autotagging for html/jsx
   {
      'windwp/nvim-ts-autotag',
      event = { 'BufReadPre', 'BufNewFile' },
      opts = {},
   },
}
