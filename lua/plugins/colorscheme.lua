-- color scheme for nvim
return {
   {
      'folke/tokyonight.nvim',
      lazy = true,
      opts = {
         style = 'night', -- 'moon' or 'night'
         transparent = true,
         on_colors = function(colors)
            -- Make the status line background transparent
            colors.bg_statusline = 'none' -- This makes the status line transparent
            colors.bg_sidebar = 'none' -- You can also make sidebars transparent
            colors.bg_float = 'none' -- And make floating windows transparent
            colors.bg_bufferline = 'none' -- Specific transparency setting for bufferline
         end,
         styles = {
            sidebars = 'transparent',
            floats = 'transparent',
         },
      },
   },
}

-- no transparency
-- return {
--    {
--       'folke/tokyonight.nvim',
--       lazy = true,
--       opts = {
--          style = 'night', -- 'moon' or 'night'
--       },
--    },
-- }

-- transparency but broken lua line
-- return {
--    {
--       'folke/tokyonight.nvim',
--       priority = 1000, -- make sure to load this before all the other start plugins
--       config = function()
--          local bg = '#011628'
--          local bg_dark = '#011423'
--          local bg_highlight = '#143652'
--          local bg_search = '#0A64AC'
--          local bg_visual = '#275378'
--          local fg = '#CBE0F0'
--          local fg_dark = '#B4D0E9'
--          local fg_gutter = '#627E97'
--          local border = '#547998'
--
--          require('tokyonight').setup {
--             style = 'night',
--             transparent = true,
--             on_colors = function(colors)
--                colors.bg = 'none' -- use "none" to enable transparency or bg to use the set color
--                colors.bg_dark = bg_dark
--                colors.bg_float = bg_dark
--                colors.bg_highlight = bg_highlight
--                colors.bg_popup = bg_dark
--                colors.bg_search = bg_search
--                colors.bg_sidebar = 'none' -- use "none" to enable transparency or bg_dark to use set color
--                colors.bg_statusline = 'none' -- use "none" to enable transparency or bg_dark to use set color
--                colors.bg_visual = bg_visual
--                colors.border = border
--                colors.fg = fg
--                colors.fg_dark = fg_dark
--                colors.fg_float = fg
--                colors.fg_gutter = fg_gutter
--                colors.fg_sidebar = fg_dark
--             end,
--             styles = {
--                sidebars = 'transparent',
--             },
--          }
--          -- load the colorscheme here
--          vim.cmd [[colorscheme tokyonight]]
--       end,
--    },
-- }

-- no transparency
-- return {
--    {
--       'folke/tokyonight.nvim',
--       priority = 1000, -- make sure to load this before all the other start plugins
--       config = function()
--          local bg = '#011628'
--          local bg_dark = '#011423'
--          local bg_highlight = '#143652'
--          local bg_search = '#0A64AC'
--          local bg_visual = '#275378'
--          local fg = '#CBE0F0'
--          local fg_dark = '#B4D0E9'
--          local fg_gutter = '#627E97'
--          local border = '#547998'
--
--          require('tokyonight').setup {
--             style = 'night',
--             on_colors = function(colors)
--                colors.bg = bg
--                colors.bg_dark = bg_dark
--                colors.bg_float = bg_dark
--                colors.bg_highlight = bg_highlight
--                colors.bg_popup = bg_dark
--                colors.bg_search = bg_search
--                colors.bg_sidebar = bg_dark
--                colors.bg_statusline = bg_dark
--                colors.bg_visual = bg_visual
--                colors.border = border
--                colors.fg = fg
--                colors.fg_dark = fg_dark
--                colors.fg_float = fg
--                colors.fg_gutter = fg_gutter
--                colors.fg_sidebar = fg_dark
--             end,
--          }
--          -- load the colorscheme here
--          vim.cmd [[colorscheme tokyonight]]
--       end,
