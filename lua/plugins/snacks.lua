return {
   'folke/snacks.nvim',
   lazy = false,
   opts = {
      toggle = { enabled = true },
      picker = {
         enabled = true,
         -- layout = { preset = "sidebar", preset_opts = { position = "right" } },
         layout = {
            preset = 'default',
            layout = { reverse = true },
         },
      },
      terminal = { enabled = true },
      lazygit = { enabled = true },
      gitbrowse = { enabled = true },
      bufdelete = { enabled = true },
      zen = { enabled = true },
      scroll = { enabled = false },
      indent = { enabled = true },
      dim = { enabled = true },
      explorer = {
         enabled = true,
         replace_netrw = true,
      },
      image = { enabled = false },
   },
   config = function(_, opts)
      local Snacks = require 'snacks'
      Snacks.setup(opts)

      -- Toggle options
      Snacks.toggle.option('spell', { name = 'Spelling' }):map '<leader>us'
      Snacks.toggle.option('wrap', { name = 'Wrap' }):map '<leader>uw'
      Snacks.toggle.option('relativenumber', { name = 'Relative Number' }):map '<leader>uL'
      Snacks.toggle.diagnostics():map '<leader>ud'
      Snacks.toggle.line_number():map '<leader>ul'
      Snacks.toggle.treesitter():map '<leader>uT'
      Snacks.toggle.option('background', { off = 'light', on = 'dark', name = 'Dark Background' }):map '<leader>ub'
      Snacks.toggle.indent():map '<leader>ug'
      Snacks.toggle.scroll():map '<leader>uS'
      Snacks.toggle.zen():map '<leader>uz'
      Snacks.toggle.zoom():map '<leader>wm'
      Snacks.toggle.dim():map '<leader>uD'

      if vim.lsp.inlay_hint then
         Snacks.toggle.inlay_hints():map '<leader>uh'
      end

      -- Picker (replaces telescope)
      vim.keymap.set('n', '<leader>ff', function()
         Snacks.picker.files()
      end, { desc = 'Find files' })
      vim.keymap.set('n', '<leader>fr', function()
         Snacks.picker.recent()
      end, { desc = 'Recent files' })
      vim.keymap.set('n', '<leader>fs', function()
         Snacks.picker.grep()
      end, { desc = 'Grep' })
      vim.keymap.set('n', '<leader>fc', function()
         Snacks.picker.grep_word()
      end, { desc = 'Grep word under cursor' })
      vim.keymap.set('n', '<leader>fh', function()
         Snacks.picker.grep { hidden = true, ignored = true }
      end, { desc = 'Grep (hidden+ignored)' })
      vim.keymap.set('n', '<leader>en', function()
         Snacks.picker.files { cwd = vim.fn.stdpath 'config' }
      end, { desc = 'Find nvim config files' })

      -- Lazygit
      if vim.fn.executable 'lazygit' == 1 then
         vim.keymap.set('n', '<leader>gg', function()
            Snacks.lazygit()
         end, { desc = 'Lazygit' })
      end

      -- Git
      vim.keymap.set('n', '<leader>gb', function()
         Snacks.picker.git_log_line()
      end, { desc = 'Git Blame Line' })
      vim.keymap.set('n', '<leader>gl', function()
         Snacks.picker.git_log()
      end, { desc = 'Git Log' })
      vim.keymap.set({ 'n', 'x' }, '<leader>gB', function()
         Snacks.gitbrowse()
      end, { desc = 'Git Browse (open)' })

      -- Floating terminal
      vim.keymap.set('n', '<leader>ft', function()
         Snacks.terminal()
      end, { desc = 'Terminal' })
      vim.keymap.set({ 'n', 't' }, '<c-/>', function()
         Snacks.terminal.focus()
      end, { desc = 'Toggle Terminal' })

      -- Buffer delete
      vim.keymap.set('n', '<leader>bd', function()
         Snacks.bufdelete()
      end, { desc = 'Delete Buffer' })
      vim.keymap.set('n', '<leader>bo', function()
         Snacks.bufdelete.other()
      end, { desc = 'Delete Other Buffers' })

      -- Explorer
      vim.keymap.set('n', '<leader>ee', function()
         Snacks.explorer()
      end, { desc = 'Toggle file explorer' })
   end,
}
