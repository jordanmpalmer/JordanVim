return {
   'nvim-telescope/telescope.nvim',
   branch = '0.1.x',
   dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      'nvim-tree/nvim-web-devicons',
      'folke/todo-comments.nvim',
   },
   config = function()
      local telescope = require 'telescope'
      local actions = require 'telescope.actions'

      telescope.setup {
         defaults = {
            vimgrep_arguments = {
               'rg',
               '--color=never',
               '--no-heading',
               '--with-filename',
               '--line-number',
               '--column',
            },
            path_display = { 'smart' },
            mappings = {
               i = {
                  ['<C-k>'] = actions.move_selection_previous, -- move to prev result
                  ['<C-j>'] = actions.move_selection_next, -- move to next result
                  ['<C-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
                  ['<C-y>'] = actions.select_default, -- accept the selected file
               },
            },
         },
      }

      telescope.load_extension 'fzf'

      -- set keymaps
      local keymap = vim.keymap -- for conciseness

      keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { desc = 'Fuzzy find files in cwd' })
      keymap.set('n', '<leader>fr', '<cmd>Telescope oldfiles<cr>', { desc = 'Fuzzy find recent files' })
      keymap.set('n', '<leader>fs', '<cmd>Telescope live_grep<cr>', { desc = 'Find string in cwd' })
      keymap.set('n', '<leader>fh', function()
         require('telescope.builtin').live_grep { hidden = true }
      end, { desc = 'Find string in cwd including hidden files' })
      keymap.set('n', '<leader>fc', '<cmd>Telescope grep_string<cr>', { desc = 'Find string under cursor in cwd' })
      keymap.set('n', '<leader>ft', '<cmd>TodoTelescope<cr>', { desc = 'Find todos' })
      -- live_grep including hidden files and also ignoring .gitignore? Use the flags you prefer:
      -- {"--hidden"}              -> include dotfiles but still respect .gitignore
      -- {"--hidden", "--no-ignore-vcs"} -> include dotfiles and ignore .gitignore (search repo ignored files)
      -- {"--hidden", "--no-ignore"}     -> include dotfiles and ignore all ignore files
      keymap.set('n', '<leader>fh', function()
         require('telescope.builtin').live_grep {
            additional_args = function()
               return { '--hidden', '--no-ignore-vcs' } -- adjust flags as desired
            end,
         }
      end, { desc = 'Find string in cwd including hidden files' })

      keymap.set('n', '<leader>en', function()
         require('telescope.builtin').find_files {
            cwd = vim.fn.stdpath 'config',
         }
      end)
   end,
}
