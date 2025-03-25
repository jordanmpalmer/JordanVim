return {
   'ThePrimeagen/harpoon',
   config = function()
      local mark = require 'harpoon.mark'
      local ui = require 'harpoon.ui'

      -- Setup harpoon
      require('harpoon').setup()

      -- Keymaps
      vim.keymap.set('n', '<leader>rr', function()
         mark.add_file()
      end, { desc = 'Add file to Harpoon' })

      vim.keymap.set('n', '<leader>re', function()
         ui.toggle_quick_menu()
      end, { desc = 'Toggle Harpoon menu' })

      vim.keymap.set('n', '<leader>rs', function()
         ui.nav_file(1)
      end, { desc = 'Navigate to Harpoon file 1' })

      vim.keymap.set('n', '<leader>rt', function()
         ui.nav_file(2)
      end, { desc = 'Navigate to Harpoon file 2' })

      vim.keymap.set('n', '<leader>rf', function()
         ui.nav_file(3)
      end, { desc = 'Navigate to Harpoon file 3' })

      vim.keymap.set('n', '<leader>rp', function()
         ui.nav_file(4)
      end, { desc = 'Navigate to Harpoon file 4' })
   end,
}
