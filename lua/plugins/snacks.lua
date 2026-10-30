return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        explorer = {
          -- Customize the sidebar layout
          layout = {
            preset = "sidebar",
            preview = false, -- Set to false to remove the 2nd window (preview pane)
            layout = {
              width = 25, -- Set your desired explorer width (default is ~40)
            },
          },
        },
      },
    },
  },
}
