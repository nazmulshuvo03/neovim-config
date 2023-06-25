-----------------------------------------------------------
---------------- Barbecue ---------------------------------
-----------------------------------------------------------

-- triggers CursorHold event faster
vim.opt.updatetime = 200

require("barbecue").setup({
  ---Whether to attach navic to language servers automatically.
  ---
  ---@type boolean
  attach_navic = true,

  ---Whether to create winbar updater autocmd.
  ---
  ---@type boolean
  create_autocmd = true,

  ---Buftypes to enable winbar in.
  ---
  ---@type string[]
  include_buftypes = { "" },

  ---Filetypes not to enable winbar in.
  ---
  ---@type string[]
  exclude_filetypes = { "netrw", "toggleterm" },

  modifiers = {
    ---Filename modifiers applied to dirname.
    ---
    ---See: `:help filename-modifiers`
    ---
    ---@type string
    dirname = ":~:.",

    ---Filename modifiers applied to basename.
    ---
    ---See: `:help filename-modifiers`
    ---
    ---@type string
    basename = "",
  },

  ---Whether to display path to file.
  ---
  ---@type boolean
  show_dirname = true,

  ---Whether to display file name.
  ---
  ---@type boolean
  show_basename = true,

  ---Whether to replace file icon with the modified symbol when buffer is
  ---modified.
  ---
  ---@type boolean
  show_modified = false,

  ---Get modified status of file.
  ---
  ---NOTE: This can be used to get file modified status from SCM (e.g. git)
  ---
  ---@type fun(bufnr: number): boolean
  modified = function(bufnr) return vim.bo[bufnr].modified end,

  ---Whether to show/use navic in the winbar.
  ---
  ---@type boolean
  show_navic = true,

  ---Get leading custom section contents.
  ---
  ---NOTE: This function shouldn't do any expensive actions as it is run on each
  ---render.
  ---
  ---@type fun(bufnr: number, winnr: number): barbecue.Config.custom_section
  lead_custom_section = function() return " " end,

  ---@alias barbecue.Config.custom_section
  ---|string # Literal string.
  ---|{ [1]: string, [2]: string? }[] # List-like table of `[text, highlight?]` tuples in which `highlight` is optional.
  ---
  ---Get custom section contents.
  ---
  ---NOTE: This function shouldn't do any expensive actions as it is run on each
  ---render.
  ---
  ---@type fun(bufnr: number, winnr: number): barbecue.Config.custom_section
  custom_section = function() return " " end,

  ---@alias barbecue.Config.theme
  ---|'"auto"' # Use your current colorscheme's theme or generate a theme based on it.
  ---|string # Theme located under `barbecue.theme` module.
  ---|barbecue.Theme # Same as '"auto"' but override it with the given table.
  ---
  ---Theme to be used for generating highlight groups dynamically.
  ---
  ---@type barbecue.Config.theme
  theme = "auto",

  ---Whether context text should follow its icon's color.
  ---
  ---@type boolean
  context_follow_icon_color = false,

  symbols = {
    ---Modification indicator.
    ---
    ---@type string
    modified = "●",

    ---Truncation indicator.
    ---
    ---@type string
    ellipsis = "…",

    ---Entry separator.
    ---
    ---@type string
    separator = "",
  },

  ---@alias barbecue.Config.kinds
  ---|false # Disable kind icons.
  ---|table<string, string> # Type to icon mapping.
  ---
  ---Icons for different context entry kinds.
  ---
  ---@type barbecue.Config.kinds
  kinds = {
    File = "",
    Module = "",
    Namespace = "",
    Package = "",
    Class = "",
    Method = "",
    Property = "",
    Field = "",
    Constructor = "",
    Enum = "",
    Interface = "",
    Function = "",
    Variable = "",
    Constant = "",
    String = "",
    Number = "",
    Boolean = "",
    Array = "",
    Object = "",
    Key = "",
    Null = "",
    EnumMember = "",
    Struct = "",
    Event = "",
    Operator = "",
    TypeParameter = "",
  },
})

vim.api.nvim_create_autocmd({
  -- "WinScrolled", -- or WinResized on NVIM-v0.9 and higher
  "WinResized",
  "BufWinEnter",
  "CursorHold",
  "InsertLeave",

  -- include this if you have set `show_modified` to `true`
  "BufModifiedSet",
}, {
  group = vim.api.nvim_create_augroup("barbecue.updater", {}),
  callback = function()
    require("barbecue.ui").update()
  end,
})

-----------------------------------------------------------
------------------ Navic ----------------------------------
-----------------------------------------------------------
local navic = require("nvim-navic")

navic.setup {
  icons = {
    File          = "󰈙 ",
    Module        = " ",
    Namespace     = "󰌗 ",
    Package       = " ",
    Class         = "󰌗 ",
    Method        = "󰆧 ",
    Property      = " ",
    Field         = " ",
    Constructor   = " ",
    Enum          = "󰕘",
    Interface     = "󰕘",
    Function      = "󰊕 ",
    Variable      = "󰆧 ",
    Constant      = "󰏿 ",
    String        = "󰀬 ",
    Number        = "󰎠 ",
    Boolean       = "◩ ",
    Array         = "󰅪 ",
    Object        = "󰅩 ",
    Key           = "󰌋 ",
    Null          = "󰟢 ",
    EnumMember    = " ",
    Struct        = "󰌗 ",
    Event         = " ",
    Operator      = "󰆕 ",
    TypeParameter = "󰊄 ",
  },
  lsp = {
    auto_attach = true,
    preference = nil,
  },
  highlight = false,
  separator = " > ",
  depth_limit = 0,
  depth_limit_indicator = "..",
  safe_output = true,
  click = false
}

-----------------------------------------------------------
------------------ Navbuddy -------------------------------
-----------------------------------------------------------
local navbuddy = require("nvim-navbuddy")
local actions = require("nvim-navbuddy.actions")

navbuddy.setup {
  window = {
    border = "single", -- "rounded", "double", "solid", "none"
    -- or an array with eight chars building up the border in a clockwise fashion
    -- starting with the top-left corner. eg: { "╔", "═" ,"╗", "║", "╝", "═", "╚", "║" }.
    size = "60%",     -- Or table format example: { height = "40%", width = "100%"}
    position = "50%", -- Or table format example: { row = "100%", col = "0%"}
    scrolloff = nil,  -- scrolloff value within navbuddy window
    sections = {
      left = {
        size = "20%",
        border = nil, -- You can set border style for each section individually as well.
      },
      mid = {
        size = "40%",
        border = nil,
      },
      right = {
        -- No size option for right most section. It fills to
        -- remaining area.
        border = nil,
        preview = "leaf", -- Right section can show previews too.
        -- Options: "leaf", "always" or "never"
      }
    },
  },
  node_markers = {
    enabled = true,
    icons = {
      leaf = "  ",
      leaf_selected = " → ",
      branch = " ",
    },
  },
  icons = {
    File          = "󰈙 ",
    Module        = " ",
    Namespace     = "󰌗 ",
    Package       = " ",
    Class         = "󰌗 ",
    Method        = "󰆧 ",
    Property      = " ",
    Field         = " ",
    Constructor   = " ",
    Enum          = "󰕘",
    Interface     = "󰕘",
    Function      = "󰊕 ",
    Variable      = "󰆧 ",
    Constant      = "󰏿 ",
    String        = " ",
    Number        = "󰎠 ",
    Boolean       = "◩ ",
    Array         = "󰅪 ",
    Object        = "󰅩 ",
    Key           = "󰌋 ",
    Null          = "󰟢 ",
    EnumMember    = " ",
    Struct        = "󰌗 ",
    Event         = " ",
    Operator      = "󰆕 ",
    TypeParameter = "󰊄 ",
  },
  use_default_mappings = true, -- If set to false, only mappings set
  -- by user are set. Else default
  -- mappings are used for keys
  -- that are not set by user
  mappings = {
    ["<esc>"] = actions.close(), -- Close and cursor to original location
    ["q"] = actions.close(),

    ["j"] = actions.next_sibling(),     -- down
    ["k"] = actions.previous_sibling(), -- up

    ["h"] = actions.parent(),           -- Move to left panel
    ["l"] = actions.children(),         -- Move to right panel
    ["0"] = actions.root(),             -- Move to first panel

    ["v"] = actions.visual_name(),      -- Visual selection of name
    ["V"] = actions.visual_scope(),     -- Visual selection of scope

    ["y"] = actions.yank_name(),        -- Yank the name to system clipboard "+
    ["Y"] = actions.yank_scope(),       -- Yank the scope to system clipboard "+

    ["i"] = actions.insert_name(),      -- Insert at start of name
    ["I"] = actions.insert_scope(),     -- Insert at start of scope

    ["a"] = actions.append_name(),      -- Insert at end of name
    ["A"] = actions.append_scope(),     -- Insert at end of scope

    ["r"] = actions.rename(),           -- Rename currently focused symbol

    ["d"] = actions.delete(),           -- Delete scope

    ["f"] = actions.fold_create(),      -- Create fold of current scope
    ["F"] = actions.fold_delete(),      -- Delete fold of current scope

    ["c"] = actions.comment(),          -- Comment out current scope

    ["<enter>"] = actions.select(),     -- Goto selected symbol
    ["o"] = actions.select(),

    ["J"] = actions.move_down(), -- Move focused node down
    ["K"] = actions.move_up(),   -- Move focused node up

    ["t"] = actions.telescope({  -- Fuzzy finder at current level.
      layout_config = {          -- All options that can be
        height = 0.60,           -- passed to telescope.nvim's
        width = 0.60,            -- default can be passed here.
        prompt_position = "top",
        preview_width = 0.50
      },
      layout_strategy = "horizontal"
    }),

    ["g?"] = actions.help(), -- Open mappings help window
  },
  lsp = {
    auto_attach = true, -- If set to true, you don't need to manually use attach function
    preference = nil,   -- list of lsp server names in order of preference
  },
  source_buffer = {
    follow_node = true, -- Keep the current node in focus on the source buffer
    highlight = true,   -- Highlight the currently focused node
    reorient = "smart", -- "smart", "top", "mid" or "none"
    scrolloff = nil     -- scrolloff value when navbuddy is open
  }
}
