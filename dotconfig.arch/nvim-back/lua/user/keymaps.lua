-- ========================================================================== --
-- ==                           GENERAL KEYMAPS                            == --
-- ========================================================================== --

vim.g.mapleader = ' '		-- Space as leader key

-- Jump movements
vim.keymap.set({'n', 'x', 'o'}, '<S-Up>', '5<Up>', {desc = 'Jump Up'})
vim.keymap.set({'n', 'x', 'o'}, '<S-Down>', '5<Down>', {desc = 'Jump Down'})

-- Window navication: Normal & Terminal
vim.keymap.set('n', '<C-n>', '<C-w>h',{desc = 'Move to window left'})	-- move to window left
vim.keymap.set('n', '<C-e>', '<C-w>j',{desc = 'Move to window down'})	-- move to window down
vim.keymap.set('n', '<C-u>', '<C-w>k',{desc = 'Move to window up'})	-- move to window up
vim.keymap.set('n', '<C-i>', '<C-w>l',{desc = 'Move to window right'})	-- move to window right

vim.keymap.set('t', '<C-n>', '<cmd>windcmd h<CR>', {desc = 'Move to window left'})	-- move to window left
vim.keymap.set('t', '<C-e>', '<cmd>windcmd j<CR>', {desc = 'Move to window down'})	-- move to window down
vim.keymap.set('t', '<C-u>', '<cmd>windcmd k<CR>', {desc = 'Move to window up'})	-- move to window up
vim.keymap.set('t', '<C-i>', '<cmd>windcmd l<CR>', {desc = 'Move to window right'})	-- move to window right

-- Window resize: Normal & Terminal
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>')	-- decrease width
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>')			-- increase height
vim.keymap.set('n', '<C-Up>', ':resize -2<CR>')				-- decrease height
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>')	-- increase width

vim.keymap.set('t', '<C-Left>', '<cmd>:vertical resize -2<CR>')	-- decrease width
vim.keymap.set('t', '<C-Down>', '<cmd>resize +2<CR>')			-- increase height
vim.keymap.set('t', '<C-Up>', '<cmd>resize -2<CR>')				-- decrease height
vim.keymap.set('t', '<C-Right>', '<cmd>vertical resize +2<CR>')	-- increase width

-- Window management
vim.keymap.set('n', '<leader>sv', '<C-w>v', {desc = 'Split window vert'})	 -- split window vertically
vim.keymap.set('n', '<leader>sh', '<C-w>s', {desc = 'Split window horiz'})	 -- split window horizontaly
vim.keymap.set('n', '<leader>se', '<C-w>=', {desc = 'Split windows equally'}) -- make split widows equal width
vim.keymap.set('n', '<leader>sq', ':close<CR>', {desc = 'Close window'})	 -- close current split window

-- Buffer navigation & management
vim.keymap.set('n','<leader>bn', ':new<CR>', {desc = 'New buffer'})	-- create new buffer
vim.keymap.set('n','<leader>bq', ':bd<CR>', {desc = 'Close buffer'})-- close current buffer
vim.keymap.set('n','<TAB>', ':bn<CR>', {desc = 'Next buffer'})		-- select next buffer
vim.keymap.set('n','<S-TAB>', ':bp<CR>', {desc = 'Prev buffer'})	-- select previous buffer

-- Tab management
vim.keymap.set('n', '<leader>to', ':tabnew<CR>', {desc = 'New tab'})	-- open new tab
vim.keymap.set('n', '<leader>tq', ':tabclose<CR>', {desc = 'Close tab'})-- close current tab
vim.keymap.set('n', '<leader>tn', ':tabn<CR>', {desc = 'Next tab'})		-- go to next tab
vim.keymap.set('n', '<leader>tp', ':tabp<CR>', {desc = 'Prev tab'})		-- go to previous tab

-- Shortcuts
vim.keymap.set({'n', 'x', 'o'}, 'k', 'i')
vim.keymap.set({'n', 'x', 'o'}, 'K', 'I')

vim.keymap.set({'n', 'x', 'o'}, '<leader>n', '^')
vim.keymap.set({'n', 'x', 'o'}, '<leader>i', 'g_')
vim.keymap.set('n', '<leader>a', ':keepjumps normal! ggVG<CR>')

-- Commands
vim.keymap.set('n', '<leader>w', '<cmd>write<CR>', {desc = 'Write file'})
vim.keymap.set('n', '<leader>q', '<cmd>q<CR>', {desc = 'Quit'})

-- Telescope
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>', {desc = 'Find files'})		-- find files within current working directory, respects .gitignore
vim.keymap.set('n', '<leader>fs', '<cmd>Telescope live_grep<cr>', {desc = 'Find in directory'})	-- find string in current working directory as you type
vim.keymap.set('n', '<leader>fc', '<cmd>Telescope current_buffer_fuzzy_find<cr>', {desc = 'Find in buffer'}) -- fuzzy search inside of the current open buffer
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>', {desc = 'list buffers'})		-- list open buffers in current neovim instance
vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', {desc = 'list help tags'})	-- list available help tags

-- nvim-tree
vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<cr>', {silent = true, desc = 'File Exprorer'}) -- toggle file explorer

