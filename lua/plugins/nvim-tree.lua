-- examples for your init.lua

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_highlight_opened_files = 1

-- set termguicolors to enable highlight groups
-- vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup({
  filters = {
      dotfiles = false,
    },
  git = {
      enable = true,
      ignore = false
    },
})

vim.keymap.set('n', '<leader>nn', ':NvimTreeFindFileToggle<CR>', {noremap = true, silent = true}) -- open in current file directory
vim.api.nvim_set_keymap('n', '<leader>nr', ':NvimTreeToggle<CR>', {noremap = true, silent = true}) -- open in current directory
vim.api.nvim_set_keymap('n', '<leader>nf', ':NvimTreeFocus<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>ns', ':NvimTreeFindFile<CR>', {noremap = true, silent = true})
