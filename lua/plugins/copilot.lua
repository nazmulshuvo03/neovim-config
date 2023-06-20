require('copilot').setup({
  panel = {
    enabled = true,
    auto_refresh = true,
    keymap = {
      jump_prev = "[[",
      jump_next = "]]",
      accept = "<CR>", -- this means 'Enter key'
      refresh = "gr",
      open = "<M-CR>" -- this means 'Alt + Enter' key
    },
    layout = {
      position = "right", -- | top | left | right | bottom
      ratio = 0.4
    },
  },
  suggestion = {
    enabled = true,
    auto_trigger = true,
    debounce = 75,
    keymap = {
      accept = "<Tab>",
      accept_word = false,
      accept_line = false,
      next = "<M-]>", -- this means 'Alt + ]' key
      prev = "<M-[>",
      dismiss = "<C-]>", -- this means 'Ctrl + ]' key
    },
  },
  filetypes = {
    yaml = false,
    markdown = false,
    help = false,
    gitcommit = false,
    gitrebase = false,
    hgcommit = false,
    svn = false,
    cvs = false,
    ["."] = false,
    ["*"] = true,
  },
  copilot_node_command = 'node', -- Node.js version must be > 16.x
  server_opts_overrides = {},
})
