return {
  "stevearc/conform.nvim",
  opts = {
    -- Set formatters specifically for Python files
    formatters_by_ft = {
      python = { "black", "isort" },
      ["htmldjango"] = { "djlint" },
    },
  },
}
