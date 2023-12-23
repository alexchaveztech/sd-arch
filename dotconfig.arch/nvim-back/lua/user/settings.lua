-- ========================================================================== --
-- ==                           EDITOR SETTINGS                            == --
-- ========================================================================== --
-- Disable netrw 
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Line Numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'

-- Search Settings
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false

-- Tabs & indentation
vim.opt.autoindent = true
vim.opt.breakindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = false
vim.opt.backspace = 'indent,eol,start'

-- Appearance
vim.opt.cursorline = true
vim.opt.signcolumn = 'yes'
vim.opt.termguicolors = true
vim.opt.background = 'dark'
vim.opt.wrap = false
vim.opt.termguicolors = true

-- Split windows
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Misc
vim.opt.clipboard:append('unnamedplus')	-- enable global clipboard
vim.opt.iskeyword:append('-')	-- dash is part of word

-- Indent-blankline
vim.opt.list = true

