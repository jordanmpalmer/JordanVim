-- Set <space> as the leader key
-- See `:help mapleader`
require 'core'
require 'lazy-vim'

vim.o.clipboard = 'unnamedplus'
vim.g.clipboard = {
   name = 'win32yank-wsl',
   copy = {
      ['+'] = '/mnt/c/Users/vn411f/Documents/WSLPlugins/win32yank.exe -i --crlf',
      ['*'] = '/mnt/c/Users/vn411f/Documents/WSLPlugins/win32yank.exe -i --crlf',
   },
   paste = {
      ['+'] = '/mnt/c/Users/vn411f/Documents/WSLPlugins/win32yank.exe -o --lf',
      ['*'] = '/mnt/c/Users/vn411f/Documents/WSLPlugins/win32yank.exe -o --lf',
   },
   cache_enabled = 0,
}

vim.opt.termguicolors = true
if vim.fn.has 'termguicolors' == 1 then
   vim.opt.termguicolors = true
end
vim.cmd 'colorscheme tokyonight'
