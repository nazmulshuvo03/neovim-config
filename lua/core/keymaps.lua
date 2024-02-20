-- Set leader to <space>
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'


-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set('i', 'jj', "<Esc>", { noremap = true})
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.keymap.set('n', 'x', '"_x') -- delete character with x but don't copy
vim.keymap.set('n', '<leader>+', '<C-a>')
vim.keymap.set('n', '<leader>-', '<C-x>')

vim.keymap.set('n', '<leader>sv', '<C-w>v') -- split window vertically
vim.keymap.set('n', '<leader>ss', '<C-w>s') -- split window horizontally
vim.keymap.set('n', '<leader>se', '<C-w>=')  -- split window equally
vim.keymap.set('n', '<leader>sx', ':close<CR>') -- close current split window

-- Move around splits
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-l>', '<C-w>l')

vim.keymap.set('n', '<leader>to', ':tabnew<CR>') -- open new tab
vim.keymap.set('n', '<leader>tx', ':tabclose<CR>') -- close current tab
vim.keymap.set('n', '<leader>tn', ':tabn<CR>')  -- go to next tab
vim.keymap.set('n', '<leader>tp', ':tabp<CR>') -- go to previous tab
