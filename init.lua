-- Set <space> as the leader key
-- See `:help mapleader`
require 'core'
require 'lazy-vim'

local win32yank_path = '/mnt/c/Users/Public/WSLPlugins/win32yank.exe'
vim.o.clipboard = 'unnamedplus'
vim.g.clipboard = {
   name = 'win32yank-wsl',
   copy = {
      ['+'] = win32yank_path .. ' -i --crlf',
      ['*'] = win32yank_path .. ' -i --crlf',
   },
   paste = {
      ['+'] = win32yank_path .. ' -o --lf',
      ['*'] = win32yank_path .. ' -o --lf',
   },
   cache_enabled = 0,
}

vim.opt.termguicolors = true
if vim.fn.has 'termguicolors' == 1 then
   vim.opt.termguicolors = true
end
vim.cmd 'colorscheme tokyonight'
