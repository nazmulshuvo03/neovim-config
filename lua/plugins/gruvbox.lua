-- vim.o.background = "dark" -- or "light" for light mode

-- vim.o.termguicolors = true
local status, _ = pcall(vim.cmd, "colorscheme gruvbox")

if not status then
  print("Colorscheme not found")
  return
end
