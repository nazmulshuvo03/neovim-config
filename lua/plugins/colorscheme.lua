return {
  -- add gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    opts = {
      transparent_mode = true,
      contrast = "hard",
    },
  },

  -- add dracula
  {
    "Mofiqul/dracula.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      italic_comment = true,
      transparent_bg = false, -- Set to true for a transparent background
      show_end_of_line = false,
      undercurl = true,
    },
  },

  -- add nord
  {
    "shaunsingh/nord.nvim",
    lazy = false,
    priority = 1000,
    init = function()
      vim.g.nord_contrast = true
      vim.g.nord_borders = true
      vim.g.nord_disable_background = false
      vim.g.nord_italic = false
      vim.g.nord_uniform_diff_background = true
      vim.g.nord_bold = false
    end,
  },

  -- add material
  {
    "marko-cerovac/material.nvim",
    priority = 1000,
    opts = {
      contrast = {
        terminal = false, -- Use darker background for terminal
        sidebars = true, -- Make neo-tree / sidebars darker than main window
        floating_windows = true, -- Darker floating windows
        cursor_line = true, -- Make current line distinct
        non_current_windows = true, -- Dim inactive windows
      },
      styles = {
        comments = { italic = true },
        strings = { italic = false },
        keywords = { italic = false, bold = true },
        functions = { bold = false },
        variables = {},
      },
      disable = {
        background = false, -- Set to true for a transparent background
        colored_cursor = false,
        borders = false,
      },
      lualine_style = "default", -- "default", "stealth", or "bubble"
    },
    init = function()
      -- Styles: "darker", "palenight", "deep ocean", "oceanic", "lighter"
      vim.g.material_style = "deep ocean"
    end,
  },

  -- Everforest setup
  {
    "neanias/everforest-nvim",
    version = false,
    lazy = false,
    priority = 1000,
    config = function(_, opts)
      require("everforest").setup(opts)
    end,
    opts = {
      background = "hard", -- "hard", "medium", or "soft"
      transparent_background_level = 0, -- 0 (solid), 1 (normal windows transparent), 2 (all transparent)
      italics = true,
      disable_italic_comments = false,
      sign_column_background = "none", -- "none" or "grey"
      ui_contrast = "low", -- "low" or "high"
      dim_inactive_windows = false,
      diagnostic_text_highlight = true,
      diagnostic_virtual_text = "coloured",
      float_style = "bright", -- "bright" or "dim"
    },
  },

  -- add nordic
  {
    "AlexvZyl/nordic.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = {
        bg = false, -- Set to true for a transparent background
        float = false,
      },
      bright_border = false,
      reduced_blue = true,
      swap_backgrounds = false,
      cursorline = {
        bold = false,
        bold_number = true,
        theme = "dark", -- "light" or "dark"
        blend = 0.85,
      },
      telescope = {
        style = "flat", -- "flat" or "classic"
      },
    },
  },

  -- add onedark
  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      -- Options: "dark", "darker", "cool", "deep", "warm", "warmer", "light"
      style = "dark",
      transparent = false, -- Set to true for a transparent background
      term_colors = true,
      ending_tildes = false,
      cmp_itemkind_reverse = false,
      code_style = {
        comments = "italic",
        keywords = "none",
        functions = "none",
        strings = "none",
        variables = "none",
      },
      diagnostics = {
        darker = true,
        undercurl = true,
        background = true,
      },
    },
  },

  -- add cyberdream
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true, -- Set to true for a transparent background
      italic_comments = true,
      hide_fillchars = false,
      borderless_telescope = true,
      terminal_colors = true,
      cache = false, -- Set to true to speed up startup after tweaking options
      theme = {
        variant = "default", -- "default" or "light"
        saturation = 1, -- 0 to 1
        highlights = {},
        colors = {},
      },
      extensions = {
        telescope = true,
        notify = true,
        mini = true,
      },
    },
  },

  -- Tell LazyVim to load it
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "material",
    },
  },
}
