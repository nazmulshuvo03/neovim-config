-- colorscheme catppuccin " catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha

require("catppuccin").setup({
    integrations = {
        mason = true,
        nvimtree = true,
        telescope = true,
        treesitter = true
    }
})

vim.cmd.colorscheme "catppuccin"

