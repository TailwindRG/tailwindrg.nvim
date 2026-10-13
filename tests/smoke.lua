vim.opt.runtimepath:prepend(vim.fn.getcwd())
local theme = require("tailwindrg")
local function hl(name)
  return vim.api.nvim_get_hl(0, { name = name, link = false })
end
local function color(hex)
  return tonumber(hex:sub(2), 16)
end
vim.o.background = "dark"
vim.cmd.colorscheme("tailwindrg")
assert(hl("Normal").bg == color(theme.palette("dark").bg))
assert(vim.g.colors_name == "tailwindrg")
assert(vim.o.termguicolors)
theme.setup({ transparent = true, italic_comments = false,
  overrides = { Keyword = { fg = "#123456" } } })
vim.cmd.colorscheme("tailwindrg")
assert(hl("Normal").bg == nil, "setup must survive colorscheme loading")
assert(not hl("Comment").italic)
assert(hl("Keyword").fg == 0x123456)
vim.cmd.colorscheme("tailwindrg-light")
assert(vim.o.background == "light")
assert(vim.g.colors_name == "tailwindrg-light")
assert(hl("Normal").fg == color(theme.palette("light").fg))
assert(hl("Normal").bg == nil)
theme.setup({ transparent = false, variant = "auto", overrides = function(c)
  return { Keyword = { fg = c.green } }
end })
vim.cmd.colorscheme("tailwindrg")
assert(hl("Normal").bg == color(theme.palette("light").bg))
assert(hl("Keyword").fg == color(theme.palette("light").green))
vim.o.background = "dark"
vim.cmd.colorscheme("tailwindrg")
assert(hl("Normal").bg == color(theme.palette("dark").bg))
for i = 0, 15 do assert(vim.g["terminal_color_" .. i]) end
for _, variant in ipairs({ "light", "dark" }) do
  theme.setup({ variant = variant })
  vim.cmd.colorscheme("tailwindrg")
  package.loaded["lualine.themes.tailwindrg"] = nil
  local line = require("lualine.themes.tailwindrg")
  assert(line.normal.c.bg == theme.palette(variant).bg_alt)
end
vim.cmd("helptags doc")
print("tailwindrg.nvim smoke tests passed")
