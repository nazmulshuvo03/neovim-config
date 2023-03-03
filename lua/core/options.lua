-- line numbers 
vim.opt.relativenumber = true
vim.opt.number = true

-- tabs and indentation
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.wrap = false

-- Case insensitive searching UNLESS /C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- cursor lin
vim.opt.cursorline = true

-- appearence
vim.opt.termguicolors = true
vim.opt.background = "dark"
-- vim.opt.signcolumn = "yes" -- added extra space before number line

-- backspace
vim.opt.backspace = "indent,eol,start"

-- clipboard
vim.opt.clipboard:append("unnamedplus")

-- split windows
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.iskeyword:append("-")

vim.opt.fillchars = {eob = " "}