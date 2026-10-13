local c = require("tailwindrg.palette")[vim.o.background == "light" and "light" or "dark"]

local function mode(accent)
  return {
    a = { fg = c.bg, bg = accent, gui = "bold" },
    b = { fg = c.fg, bg = c.bg_visual },
    c = { fg = c.fg_dim, bg = c.bg_alt },
  }
end

return {
  normal   = mode(c.navy_lt),
  insert   = mode(c.orange),
  visual   = mode(c.sky),
  replace  = mode(c.red),
  command  = mode(c.peach),
  terminal = mode(c.green),
  inactive = {
    a = { fg = c.fg_mute, bg = c.bg_alt },
    b = { fg = c.fg_mute, bg = c.bg_alt },
    c = { fg = c.fg_mute, bg = c.bg_alt },
  },
}
