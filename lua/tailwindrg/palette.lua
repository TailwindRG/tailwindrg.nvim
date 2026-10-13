-- Tailwind Resource Group palette for Neovim.
-- Brand anchors: Navy #30427E, Warm Orange #FF914D (tokens from the TRG design system).
-- Syntax hues not in the brand (sky, green, red) are lightened derivatives of the
-- system's logo blue, success and danger tones so they hold 4.5:1+ on the background.

local M = {}

M.dark = {
  bg        = "#0c1226", -- navy-950
  bg_alt    = "#15203b", -- navy-900  (floats, statusline, sidebars)
  bg_hl     = "#1a2546", -- cursorline
  bg_visual = "#283867", -- navy-700
  border    = "#1f2c50", -- navy-800
  fg        = "#e1e4ea", -- neutral-200
  fg_dim    = "#a3aab8", -- neutral-400
  fg_mute   = "#62739c", -- navy-400  (line numbers, whitespace)
  comment   = "#8a98ba", -- navy-300
  navy      = "#30427e", -- navy-600  (brand)
  navy_lt   = "#b3bcd6", -- navy-200
  type      = "#d8deec", -- navy-100
  orange    = "#ff914d", -- orange-400 (brand accent: keywords)
  orange_lt = "#ffa86a", -- orange-300 (preproc, special)
  peach     = "#ffc593", -- orange-200 (numbers, constants)
  sky       = "#8ea2e8", -- derived from logo blue #0123a1 (functions)
  green     = "#6cc69a", -- derived from success #1f8a5b (strings)
  red       = "#f0788c", -- derived from danger #c4324b (errors)
  yellow    = "#ffe1c7", -- orange-100 (search)
  diff_add  = "#16332e",
  diff_del  = "#3a1a2a",
  diff_chg  = "#1f2c50",
}

M.light = {
  bg        = "#f8f9fa", -- neutral-50 (page bg)
  bg_alt    = "#eef0f3", -- neutral-100
  bg_hl     = "#eef1f8", -- navy-50
  bg_visual = "#d8deec", -- navy-100
  border    = "#e1e4ea", -- neutral-200
  fg        = "#1a2332", -- neutral-900
  fg_dim    = "#404a5d", -- neutral-700
  fg_mute   = "#a3aab8", -- neutral-400
  comment   = "#5b6477", -- neutral-600
  navy      = "#30427e", -- navy-600
  navy_lt   = "#62739c", -- navy-400
  type      = "#455690", -- navy-500
  orange    = "#a8470d", -- orange-700 (keywords; 5.6:1)
  orange_lt = "#455690", -- preproc reuses navy-500 on light
  peach     = "#7a3209", -- orange-800 (numbers)
  sky       = "#30427e", -- functions = brand navy
  green     = "#18744c", -- darkened success
  red       = "#c4324b", -- danger
  yellow    = "#ffc593", -- orange-200 (search)
  diff_add  = "#e6f4ec",
  diff_del  = "#fbeaee",
  diff_chg  = "#eef1f8",
}

return M
