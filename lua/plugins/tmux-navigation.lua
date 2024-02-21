return {
  {
    "alexghergh/nvim-tmux-navigation",
    config = function()
      local nvim_tmux_nav = require("nvim-tmux-navigation")

      nvim_tmux_nav.setup({
        disable_when_zoomed = true, -- defaults to false
      })

      vim.keymap.set("n", "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
      vim.keymap.set("n", "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
      vim.keymap.set("n", "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
      vim.keymap.set("n", "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
      vim.keymap.set("n", "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
      vim.keymap.set("n", "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)
    end,
    keys = {
      { "<C-h>", "nvim_tmux_nav.NvimTmuxNavigateLeft", desc = "Go to Left panel" },
      { "<C-j>", "nvim_tmux_nav.NvimTmuxNavigateDown", desc = "Go to Down panel" },
      { "<C-k>", "nvim_tmux_nav.NvimTmuxNavigateUp", desc = "Go to Up panel" },
      { "<C-l>", "nvim_tmux_nav.NvimTmuxNavigateRight", desc = "Go to Right panel" },
      -- { "<C-\\>", "nvim_tmux_nav.NvimTmuxNavigateLastActive", desc = "Go to Last Active panel" },
      -- { "<C-Space>", "nvim_tmux_nav.NvimTmuxNavigateNext", desc = "Go to Next panel" },
    },
  },
}
