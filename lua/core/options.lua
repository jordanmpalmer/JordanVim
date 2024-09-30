-- [[ Setting options ]]
-- See `:help vim.opt`
--  For more options `:help option-list`

-- tree mode in nvim file explorer
vim.cmd("let g:netrw_liststyle = 3")

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

local opt = vim.opt

-- Make line numbers default
opt.number = true
opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- opt.clipboard:append('unnamedplus')

-- Enable break indent
opt.breakindent = true

-- Tab settings
opt.tabstop = 3 -- 3 spaces for tabs
opt.softtabstop = 3 --
opt.shiftwidth = 3 -- 3 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy ident from current line when starting new one

-- Save undo history
opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
opt.ignorecase = true
opt.smartcase = true

-- Decrease how long to wait after you stop typing to update swap file
opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
-- Set the timeout for key sequences like 'nn'
opt.timeoutlen = 300 -- Allows 400ms for pressing 'nn'

-- Configure how new splits should be opened
opt.splitright = true
opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
opt.list = true
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
opt.inccommand = 'split'

-- Show/highlight which line your cursor is on
opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
opt.scrolloff = 10

opt.termguicolors = true
opt.background = "dark" -- colorschemer that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace 
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line, or insert mode start position

