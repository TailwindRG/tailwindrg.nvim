local M = {}

M.config = {
  variant = "auto",        -- "dark" | "light" | "auto" (follows vim.o.background)
  transparent = false,     -- leave Normal bg unset
  italic_comments = true,
  overrides = {},          -- function(c) return { Group = { ... } } end, or a table
}

function M.setup(opts)
  M.config = vim.tbl_deep_extend("force", M.config, opts or {})
end

local function groups(c, cfg)
  local bg = cfg.transparent and "NONE" or c.bg
  local it = cfg.italic_comments
  return {
    -- Editor UI
    Normal        = { fg = c.fg, bg = bg },
    NormalNC      = { fg = c.fg, bg = bg },
    NormalFloat   = { fg = c.fg, bg = c.bg_alt },
    FloatBorder   = { fg = c.navy_lt, bg = c.bg_alt },
    FloatTitle    = { fg = c.orange, bg = c.bg_alt, bold = true },
    WinSeparator  = { fg = c.border },
    Cursor        = { fg = c.bg, bg = c.orange },
    CursorLine    = { bg = c.bg_hl },
    CursorColumn  = { bg = c.bg_hl },
    ColorColumn   = { bg = c.bg_alt },
    CursorLineNr  = { fg = c.orange, bold = true },
    LineNr        = { fg = c.fg_mute },
    SignColumn    = { bg = bg },
    FoldColumn    = { fg = c.fg_mute, bg = bg },
    Folded        = { fg = c.comment, bg = c.bg_alt },
    Visual        = { bg = c.bg_visual },
    Search        = { fg = c.bg, bg = c.yellow },
    IncSearch     = { fg = c.bg, bg = c.orange },
    CurSearch     = { link = "IncSearch" },
    Substitute    = { fg = c.bg, bg = c.red },
    MatchParen    = { fg = c.orange, bold = true, underline = true },
    NonText       = { fg = c.fg_mute },
    Whitespace    = { fg = c.border },
    SpecialKey    = { fg = c.fg_mute },
    EndOfBuffer   = { fg = c.bg },
    Pmenu         = { fg = c.fg, bg = c.bg_alt },
    PmenuSel      = { fg = c.fg, bg = c.bg_visual, bold = true },
    PmenuSbar     = { bg = c.bg_alt },
    PmenuThumb    = { bg = c.navy },
    StatusLine    = { fg = c.fg, bg = c.bg_alt },
    StatusLineNC  = { fg = c.fg_mute, bg = c.bg_alt },
    TabLine       = { fg = c.fg_dim, bg = c.bg_alt },
    TabLineFill   = { bg = c.bg_alt },
    TabLineSel    = { fg = c.fg, bg = bg, bold = true },
    WinBar        = { fg = c.fg_dim, bg = bg },
    Title         = { fg = c.orange, bold = true },
    Directory     = { fg = c.sky },
    ErrorMsg      = { fg = c.red },
    WarningMsg    = { fg = c.orange },
    MoreMsg       = { fg = c.green },
    Question      = { fg = c.sky },
    ModeMsg       = { fg = c.fg_dim, bold = true },
    QuickFixLine  = { bg = c.bg_visual },
    SpellBad      = { sp = c.red, undercurl = true },
    SpellCap      = { sp = c.orange, undercurl = true },
    SpellRare     = { sp = c.sky, undercurl = true },
    SpellLocal    = { sp = c.green, undercurl = true },

    -- Syntax
    Comment       = { fg = c.comment, italic = it },
    Constant      = { fg = c.peach },
    String        = { fg = c.green },
    Character     = { fg = c.green },
    Number        = { fg = c.peach },
    Boolean       = { fg = c.peach, bold = true },
    Float         = { fg = c.peach },
    Identifier    = { fg = c.fg },
    Function      = { fg = c.sky },
    Statement     = { fg = c.orange },
    Keyword       = { fg = c.orange },
    Conditional   = { fg = c.orange },
    Repeat        = { fg = c.orange },
    Exception     = { fg = c.orange },
    Label         = { fg = c.orange_lt },
    Operator      = { fg = c.fg_dim },
    PreProc       = { fg = c.orange_lt },
    Include       = { fg = c.orange },
    Type          = { fg = c.type },
    StorageClass  = { fg = c.orange },
    Structure     = { fg = c.type },
    Special       = { fg = c.orange_lt },
    SpecialChar   = { fg = c.peach },
    Delimiter     = { fg = c.fg_dim },
    Tag           = { fg = c.sky },
    Underlined    = { underline = true },
    Error         = { fg = c.red },
    Todo          = { fg = c.bg, bg = c.orange, bold = true },

    -- Treesitter
    ["@variable"]            = { fg = c.fg },
    ["@variable.builtin"]    = { fg = c.orange_lt, italic = true },
    ["@variable.parameter"]  = { fg = c.navy_lt },
    ["@variable.member"]     = { fg = c.fg },
    ["@property"]            = { fg = c.fg },
    ["@constant"]            = { fg = c.peach },
    ["@constant.builtin"]    = { fg = c.peach, bold = true },
    ["@module"]              = { fg = c.type },
    ["@string"]              = { fg = c.green },
    ["@string.escape"]       = { fg = c.peach },
    ["@string.regexp"]       = { fg = c.orange_lt },
    ["@string.special.url"]  = { fg = c.sky, underline = true },
    ["@function"]            = { fg = c.sky },
    ["@function.builtin"]    = { fg = c.sky, italic = true },
    ["@function.call"]       = { fg = c.sky },
    ["@function.method"]     = { fg = c.sky },
    ["@constructor"]         = { fg = c.type },
    ["@keyword"]             = { fg = c.orange },
    ["@keyword.function"]    = { fg = c.orange },
    ["@keyword.return"]      = { fg = c.orange, italic = true },
    ["@keyword.import"]      = { fg = c.orange },
    ["@type"]                = { fg = c.type },
    ["@type.builtin"]        = { fg = c.type, italic = true },
    ["@attribute"]           = { fg = c.orange_lt },
    ["@punctuation"]         = { fg = c.fg_dim },
    ["@punctuation.bracket"] = { fg = c.fg_dim },
    ["@tag"]                 = { fg = c.sky },
    ["@tag.attribute"]       = { fg = c.navy_lt },
    ["@tag.delimiter"]       = { fg = c.fg_mute },
    ["@markup.heading"]      = { fg = c.orange, bold = true },
    ["@markup.strong"]       = { bold = true },
    ["@markup.italic"]       = { italic = true },
    ["@markup.link"]         = { fg = c.sky },
    ["@markup.link.url"]     = { fg = c.sky, underline = true },
    ["@markup.raw"]          = { fg = c.green },
    ["@markup.list"]         = { fg = c.orange },
    ["@comment.todo"]        = { link = "Todo" },
    ["@comment.error"]       = { fg = c.bg, bg = c.red, bold = true },
    ["@comment.warning"]     = { fg = c.bg, bg = c.orange, bold = true },
    ["@comment.note"]        = { fg = c.bg, bg = c.sky, bold = true },

    -- LSP semantic tokens
    ["@lsp.type.parameter"]  = { link = "@variable.parameter" },
    ["@lsp.type.property"]   = { link = "@property" },
    ["@lsp.type.namespace"]  = { link = "@module" },
    ["@lsp.type.interface"]  = { fg = c.type, italic = true },
    ["@lsp.mod.deprecated"]  = { strikethrough = true },
    LspReferenceText         = { bg = c.bg_visual },
    LspReferenceRead         = { bg = c.bg_visual },
    LspReferenceWrite        = { bg = c.bg_visual, underline = true },
    LspInlayHint             = { fg = c.fg_mute, italic = true },

    -- Diagnostics
    DiagnosticError          = { fg = c.red },
    DiagnosticWarn           = { fg = c.orange },
    DiagnosticInfo           = { fg = c.sky },
    DiagnosticHint           = { fg = c.navy_lt },
    DiagnosticOk             = { fg = c.green },
    DiagnosticUnderlineError = { sp = c.red, undercurl = true },
    DiagnosticUnderlineWarn  = { sp = c.orange, undercurl = true },
    DiagnosticUnderlineInfo  = { sp = c.sky, undercurl = true },
    DiagnosticUnderlineHint  = { sp = c.navy_lt, undercurl = true },
    DiagnosticVirtualTextError = { fg = c.red, bg = c.diff_del },
    DiagnosticVirtualTextWarn  = { fg = c.orange, bg = c.bg_alt },
    DiagnosticVirtualTextInfo  = { fg = c.sky, bg = c.bg_alt },
    DiagnosticVirtualTextHint  = { fg = c.navy_lt, bg = c.bg_alt },

    -- Diff / git
    DiffAdd       = { bg = c.diff_add },
    DiffDelete    = { bg = c.diff_del },
    DiffChange    = { bg = c.diff_chg },
    DiffText      = { bg = c.bg_visual, bold = true },
    Added         = { fg = c.green },
    Removed       = { fg = c.red },
    Changed       = { fg = c.orange },
    GitSignsAdd    = { fg = c.green },
    GitSignsChange = { fg = c.orange },
    GitSignsDelete = { fg = c.red },

    -- Telescope
    TelescopeNormal         = { fg = c.fg, bg = c.bg_alt },
    TelescopeBorder         = { fg = c.border, bg = c.bg_alt },
    TelescopePromptBorder   = { fg = c.orange, bg = c.bg_alt },
    TelescopeTitle          = { fg = c.orange, bold = true },
    TelescopeSelection      = { bg = c.bg_visual },
    TelescopeMatching       = { fg = c.orange, bold = true },

    -- Neo-tree / nvim-tree
    NeoTreeNormal           = { fg = c.fg, bg = c.bg_alt },
    NeoTreeNormalNC         = { fg = c.fg, bg = c.bg_alt },
    NeoTreeDirectoryIcon    = { fg = c.sky },
    NeoTreeRootName         = { fg = c.orange, bold = true },
    NvimTreeNormal          = { fg = c.fg, bg = c.bg_alt },
    NvimTreeFolderIcon      = { fg = c.sky },
    NvimTreeRootFolder      = { fg = c.orange, bold = true },

    -- Misc plugins
    IblIndent               = { fg = c.border },
    IblScope                = { fg = c.navy },
    WhichKey                = { fg = c.orange },
    WhichKeyGroup           = { fg = c.sky },
    WhichKeyDesc            = { fg = c.fg },
    CmpItemAbbrMatch        = { fg = c.orange, bold = true },
    CmpItemAbbrMatchFuzzy   = { fg = c.orange },
    CmpItemKindFunction     = { fg = c.sky },
    CmpItemKindMethod       = { fg = c.sky },
    CmpItemKindVariable     = { fg = c.fg },
    CmpItemKindKeyword      = { fg = c.orange },
    BlinkCmpLabelMatch      = { fg = c.orange, bold = true },
  }
end

function M.load(variant)
  local cfg = M.config
  variant = variant or cfg.variant
  if variant == "auto" then variant = vim.o.background end
  local c = require("tailwindrg.palette")[variant] or require("tailwindrg.palette").dark

  if vim.g.colors_name then vim.cmd("hi clear") end
  vim.o.termguicolors = true
  vim.o.background = variant == "light" and "light" or "dark"
  vim.g.colors_name = variant == "light" and "tailwindrg-light" or "tailwindrg"

  local hl = groups(c, cfg)
  local ov = type(cfg.overrides) == "function" and cfg.overrides(c) or cfg.overrides
  hl = vim.tbl_extend("force", hl, ov or {})
  for name, spec in pairs(hl) do
    vim.api.nvim_set_hl(0, name, spec)
  end

  -- Terminal colors
  local term = { c.bg_alt, c.red, c.green, c.orange, c.sky, c.navy_lt, c.type, c.fg_dim,
                 c.fg_mute, c.red, c.green, c.peach, c.sky, c.navy_lt, c.type, c.fg }
  for i, col in ipairs(term) do vim.g["terminal_color_" .. (i - 1)] = col end
end

M.palette = function(variant) return require("tailwindrg.palette")[variant or "dark"] end

return M
