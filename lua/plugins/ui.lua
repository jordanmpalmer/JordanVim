return {
   -- bufferline
   {
      'akinsho/bufferline.nvim',
      event = 'VeryLazy',
      dependencies = {},
      version = '*',
      keys = {
         { '<leader>bp', '<Cmd>BufferLineTogglePin<CR>', desc = 'Toggle Pin' },
         { '<leader>bP', '<Cmd>BufferLineGroupClose ungrouped<CR>', desc = 'Delete Non-Pinned Buffers' },
         { '<leader>br', '<Cmd>BufferLineCloseRight<CR>', desc = 'Delete Buffers to the Right' },
         { '<leader>bl', '<Cmd>BufferLineCloseLeft<CR>', desc = 'Delete Buffers to the Left' },
         { '<S-h>', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev Buffer' },
         { '<S-l>', '<cmd>BufferLineCycleNext<cr>', desc = 'Next Buffer' },
         { '[b', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev Buffer' },
         { ']b', '<cmd>BufferLineCycleNext<cr>', desc = 'Next Buffer' },
         { '[B', '<cmd>BufferLineMovePrev<cr>', desc = 'Move buffer prev' },
         { ']B', '<cmd>BufferLineMoveNext<cr>', desc = 'Move buffer next' },
         { '<leader>bj', '<cmd>BufferLinePick<cr>', desc = 'Pick Buffer' },
      },
      config = function()
         local highlights = {}
         local ok, tokyonight_bl = pcall(function()
            return require('tokyonight.integrations.bufferline').get()
         end)
         if ok then
            highlights = tokyonight_bl
         end

         require('bufferline').setup {
            options = {
               mode = 'buffers',
               -- separator_style = 'slant',
               separator_style = 'slant',
               always_show_bufferline = false,
               diagnostics = 'nvim_lsp',
               offsets = {
                  {
                     filetype = 'snacks_layout_box',
                     text = 'Explorer',
                     highlight = 'Directory',
                     text_align = 'left',
                  },
               },
            },
            highlights = vim.tbl_extend('force', highlights, {
               separator = { fg = '#00afff' },
               separator_selected = { fg = '#00afff' },
               separator_visible = { fg = '#00afff' },
            }),
         }
      end,
   },

   -- status line
   {
      'nvim-lualine/lualine.nvim',
      event = 'VeryLazy',
      config = function()
         local colors = {
            blue = '#65D1FF',
            green = '#3EFFDC',
            violet = '#FF61EF',
            yellow = '#FFDA7B',
            red = '#FF4A4A',
            fg = '#c3ccdc',
            text = '#112638',
            bg = 'none',
            inactive_bg = 'none',
            semilightgray = '#a0a0a0',
         }

         local theme = {
            normal = {
               a = { bg = colors.blue, fg = colors.text, gui = 'bold' },
               b = { bg = colors.bg, fg = colors.fg },
               c = { bg = colors.bg, fg = colors.fg },
            },
            insert = {
               a = { bg = colors.green, fg = colors.text, gui = 'bold' },
               b = { bg = colors.bg, fg = colors.fg },
               c = { bg = colors.bg, fg = colors.fg },
            },
            visual = {
               a = { bg = colors.violet, fg = colors.text, gui = 'bold' },
               b = { bg = colors.bg, fg = colors.fg },
               c = { bg = colors.bg, fg = colors.fg },
            },
            command = {
               a = { bg = colors.yellow, fg = colors.text, gui = 'bold' },
               b = { bg = colors.bg, fg = colors.fg },
               c = { bg = colors.bg, fg = colors.fg },
            },
            replace = {
               a = { bg = colors.red, fg = colors.text, gui = 'bold' },
               b = { bg = colors.bg, fg = colors.fg },
               c = { bg = colors.bg, fg = colors.fg },
            },
            inactive = {
               a = { bg = colors.inactive_bg, fg = colors.semilightgray, gui = 'bold' },
               b = { bg = colors.inactive_bg, fg = colors.semilightgray },
               c = { bg = colors.inactive_bg, fg = colors.semilightgray },
            },
         }

         require('lualine').setup {
            options = {
               theme = theme,
               globalstatus = true,
               disabled_filetypes = { statusline = { 'dashboard', 'alpha' } },
            },
            sections = {
               lualine_a = { 'mode' },
               lualine_b = { 'branch' },
               lualine_c = {
                  { 'diagnostics' },
                  { 'filetype', icon_only = true, separator = '', padding = { left = 1, right = 0 } },
                  { 'filename', path = 1 },
               },
               lualine_x = {
                  {
                     require('lazy.status').updates,
                     cond = require('lazy.status').has_updates,
                     color = { fg = '#ff9e64' },
                  },
                  {
                     'diff',
                     source = function()
                        local gitsigns = vim.b.gitsigns_status_dict
                        if gitsigns then
                           return {
                              added = gitsigns.added,
                              modified = gitsigns.changed,
                              removed = gitsigns.removed,
                           }
                        end
                     end,
                  },
               },
               lualine_y = {
                  { 'progress', separator = ' ', padding = { left = 1, right = 0 } },
                  { 'location', padding = { left = 0, right = 1 } },
               },
               lualine_z = {
                  function()
                     return ' ' .. os.date '%R'
                  end,
               },
            },
            extensions = { 'neo-tree', 'lazy' },
         }
      end,
   },
   -- -- improves status line (old config)
   -- {
   --    'nvim-lualine/lualine.nvim',
   --    dependencies = {},
   --    config = function()
   --       local lualine = require 'lualine'
   --       local lazy_status = require 'lazy.status' -- to configure lazy pending updates count
   --
   --       local colors = {
   --          blue = '#65D1FF',
   --          green = '#3EFFDC',
   --          violet = '#FF61EF',
   --          yellow = '#FFDA7B',
   --          red = '#FF4A4A',
   --          fg = '#c3ccdc',
   --          text = '#112638',
   --          bg = 'none', -- '#112638',
   --          inactive_bg = 'none', --'#2c3043',
   --       }
   --
   --       local my_lualine_theme = {
   --          normal = {
   --             a = { bg = colors.blue, fg = colors.text, gui = 'bold' },
   --             b = { bg = colors.bg, fg = colors.fg },
   --             c = { bg = colors.bg, fg = colors.fg },
   --          },
   --          insert = {
   --             a = { bg = colors.green, fg = colors.text, gui = 'bold' },
   --             b = { bg = colors.bg, fg = colors.fg },
   --             c = { bg = colors.bg, fg = colors.fg },
   --          },
   --          visual = {
   --             a = { bg = colors.violet, fg = colors.text, gui = 'bold' },
   --             b = { bg = colors.bg, fg = colors.fg },
   --             c = { bg = colors.bg, fg = colors.fg },
   --          },
   --          command = {
   --             a = { bg = colors.yellow, fg = colors.text, gui = 'bold' },
   --             b = { bg = colors.bg, fg = colors.fg },
   --             c = { bg = colors.bg, fg = colors.fg },
   --          },
   --          replace = {
   --             a = { bg = colors.red, fg = colors.text, gui = 'bold' },
   --             b = { bg = colors.bg, fg = colors.fg },
   --             c = { bg = colors.bg, fg = colors.fg },
   --          },
   --          inactive = {
   --             a = { bg = colors.inactive_bg, fg = colors.semilightgray, gui = 'bold' },
   --             b = { bg = colors.inactive_bg, fg = colors.semilightgray },
   --             c = { bg = colors.inactive_bg, fg = colors.semilightgray },
   --          },
   --       }
   --
   --       -- configure lualine with modified theme
   --       lualine.setup {
   --          options = {
   --             theme = my_lualine_theme,
   --          },
   --          sections = {
   --             lualine_x = {
   --                {
   --                   lazy_status.updates,
   --                   cond = lazy_status.has_updates,
   --                   color = { fg = '#ff9e64' },
   --                },
   --                { 'encoding' },
   --                { 'fileformat' },
   --                { 'filetype' },
   --             },
   --          },
   --       }
   --    end,
   -- },

   -- icons
   {
      'nvim-mini/mini.icons',
      lazy = true,
      opts = {
         file = {
            ['.keep'] = { glyph = '󰊢', hl = 'MiniIconsGrey' },
            ['devcontainer.json'] = { glyph = '', hl = 'MiniIconsAzure' },
         },
         filetype = {
            dotenv = { glyph = '', hl = 'MiniIconsYellow' },
         },
      },
      init = function()
         package.preload['nvim-web-devicons'] = function()
            require('mini.icons').mock_nvim_web_devicons()
            return package.loaded['nvim-web-devicons']
         end
      end,
   },

   -- Highly experimental plugin that completely replaces the UI for messages, cmdline and the popupmenu.
   {
      'folke/noice.nvim',
      event = 'VeryLazy',
      dependencies = {
         'MunifTanjim/nui.nvim',
      },
      opts = {
         lsp = {
            override = {
               ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
               ['vim.lsp.util.stylize_markdown'] = true,
               ['cmp.entry.get_documentation'] = true,
            },
         },
         routes = {
            {
               filter = {
                  event = 'msg_show',
                  any = {
                     { find = '%d+L, %d+B' },
                     { find = '; after #%d+' },
                     { find = '; before #%d+' },
                  },
               },
               view = 'mini',
            },
         },
         presets = {
            bottom_search = true,
            command_palette = true,
            long_message_to_split = true,
         },
      },
    -- stylua: ignore
    keys = {
      { "<leader>sn", "", desc = "+noice"},
      { "<S-Enter>", function() require("noice").redirect(vim.fn.getcmdline()) end, mode = "c", desc = "Redirect Cmdline" },
      { "<leader>snl", function() require("noice").cmd("last") end, desc = "Noice Last Message" },
      { "<leader>snh", function() require("noice").cmd("history") end, desc = "Noice History" },
      { "<leader>sna", function() require("noice").cmd("all") end, desc = "Noice All" },
      { "<leader>snd", function() require("noice").cmd("dismiss") end, desc = "Dismiss All" },
      { "<leader>snt", function() require("noice").cmd("pick") end, desc = "Noice Picker (Telescope/FzfLua)" },
      { "<c-f>", function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end, silent = true, expr = true, desc = "Scroll Forward", mode = {"i", "n", "s"} },
      { "<c-b>", function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end, silent = true, expr = true, desc = "Scroll Backward", mode = {"i", "n", "s"}},
    },
      config = function(_, opts)
         -- HACK: noice shows messages from before it was enabled,
         -- but this is not ideal when Lazy is installing plugins,
         -- so clear the messages in this case.
         if vim.o.filetype == 'lazy' then
            vim.cmd [[messages clear]]
         end
         require('noice').setup(opts)
      end,
   },
}
