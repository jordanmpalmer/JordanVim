-- Makes tabs look better
return {
   'akinsho/bufferline.nvim',
   dependencies = { 'nvim-tree/nvim-web-devicons' },
   version = '*',
   opts = {
      options = {
         mode = 'tabs', -- Show buffers as tabs
         separator_style = 'slant', -- Choose separator style
         -- Optional: Adjust other options if needed
      },
      highlights = {
         background = {
            gui = 'NONE', -- Ensure no background color
            cterm = 'NONE',
         },
         buffer_selected = {
            gui = 'NONE', -- No background for selected buffer
            cterm = 'NONE',
         },
         separator = {
            gui = 'NONE', -- Remove separator background
            cterm = 'NONE',
         },
         separator_selected = {
            gui = 'NONE', -- Remove selected separator background
            cterm = 'NONE',
         },
         -- Optional: Adjust other specific elements if needed
      },
   },
}

-- return {
--    'akinsho/bufferline.nvim',
--    dependencies = { 'nvim-tree/nvim-web-devicons' },
--    version = '*',
--    opts = {
--       options = {
--          mode = 'tabs',
--          separator_style = 'slant',
--       },
--    },
-- }
