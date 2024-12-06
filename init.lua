-- Set <space> as the leader key
-- See `:help mapleader`
require 'core'
-- require 'lazy'

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

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
   local out = vim.fn.system {
      'git',
      'clone',
      '--filter=blob:none',
      '--branch=stable',
      'https://github.com/folke/lazy.nvim.git',
      lazypath,
   }
   if vim.v.shell_error ~= 0 then
      error('Error cloning lazy.nvim:\n' .. out)
   end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({ { import = 'plugins' }, { import = 'plugins.lsp' } }, {
   checker = {
      enabled = true,
      notify = false,
   },
   change_detection = {
      notify = false,
   },
})

vim.opt.termguicolors = true
if vim.fn.has 'termguicolors' == 1 then
   vim.opt.termguicolors = true
end
vim.cmd 'colorscheme tokyonight'
