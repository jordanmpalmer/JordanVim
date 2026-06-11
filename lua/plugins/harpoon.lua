return {
   "ThePrimeagen/harpoon",
   branch = "harpoon2",
   dependencies = { "nvim-lua/plenary.nvim" },
   config = function()
      local harpoon = require("harpoon")
      harpoon:setup()

      vim.keymap.set("n", "<leader>rr", function() harpoon:list():add() end, { desc = "Add file to Harpoon" })
      vim.keymap.set("n", "<leader>re", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Toggle Harpoon menu" })
      vim.keymap.set("n", "<leader>rs", function() harpoon:list():select(1) end, { desc = "Harpoon file 1" })
      vim.keymap.set("n", "<leader>rt", function() harpoon:list():select(2) end, { desc = "Harpoon file 2" })
      vim.keymap.set("n", "<leader>rf", function() harpoon:list():select(3) end, { desc = "Harpoon file 3" })
      vim.keymap.set("n", "<leader>rp", function() harpoon:list():select(4) end, { desc = "Harpoon file 4" })
      vim.keymap.set("n", "<leader>rc", function() harpoon:list():select(5) end, { desc = "Harpoon file 5" })
      vim.keymap.set("n", "<leader>rd", function() harpoon:list():select(6) end, { desc = "Harpoon file 6" })
   end,
}
