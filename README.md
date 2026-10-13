# tailwindrg.nvim

A Neovim colorscheme based on Tailwind Resource Group's navy and warm orange
palette. Includes dark and light variants, Treesitter and LSP highlights,
terminal colors, and a lualine theme.

## Requirements

- Neovim 0.9 or newer.
- A terminal with true color support. The theme enables `termguicolors`.

No runtime dependencies or build step are required.

## Install with lazy.nvim

Add this spec to your plugin configuration:

```lua
{
  "TailwindRG/tailwindrg.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("tailwindrg").setup({
      variant = "dark",
    })
    vim.cmd.colorscheme("tailwindrg")
  end,
}
```

Restart Neovim and run `:Lazy sync` to install the theme.

## Install with Neovim packages

On Linux or macOS, clone into Neovim's package directory:

```bash
git clone https://github.com/TailwindRG/tailwindrg.nvim.git \
  ~/.local/share/nvim/site/pack/themes/start/tailwindrg.nvim
```

If you set `XDG_DATA_HOME` or use `NVIM_APPNAME`, use the package directory
under `:echo stdpath('data')` instead. Add this to your `init.lua`:

```lua
vim.opt.background = "dark"
vim.cmd.colorscheme("tailwindrg")
```

## Choose a variant

The default `variant = "auto"` follows Neovim's `background` option:

```lua
vim.opt.background = "light"
vim.cmd.colorscheme("tailwindrg")
```

To select light mode directly, run `:colorscheme tailwindrg-light`.
To switch back, set `background=dark` and run `:colorscheme tailwindrg`.
If you configure a fixed variant in `setup()`, `tailwindrg` uses that variant;
`tailwindrg-light` always loads the light palette.

## Configuration

Call `setup()` before applying the colorscheme. All options are optional:

```lua
require("tailwindrg").setup({
  variant = "auto", -- "dark", "light", or "auto"
  transparent = false, -- transparent editor, sign, fold, and tab backgrounds
  italic_comments = true,
  overrides = {}, -- highlight definitions, or a function that receives the palette
})
vim.cmd.colorscheme("tailwindrg")
```

Transparent mode keeps backgrounds for floats, menus, sidebars, and selections.
To customize highlights, provide a table or a function:

```lua
require("tailwindrg").setup({
  overrides = function(colors)
    return {
      Comment = { fg = colors.comment, italic = false },
      NormalFloat = { fg = colors.fg, bg = "NONE" },
    }
  end,
})
vim.cmd.colorscheme("tailwindrg")
```

Read a palette with `require("tailwindrg").palette("dark")` or `.palette("light")`.

## Lualine

Set the theme in your existing lualine configuration:

```lua
require("lualine").setup({
  options = { theme = "tailwindrg" },
})
```

Apply the colorscheme before setting up lualine so it uses the matching palette.
After switching variants, run your lualine setup again to refresh its colors.

## Highlight support

Includes highlights for core UI and syntax, Treesitter, LSP semantic tokens,
diagnostics, diffs, GitSigns, Telescope, Neo-tree, nvim-tree, nvim-cmp,
blink.cmp, which-key, and indent-blankline. These plugins are optional.

## Dark palette

| Role | Hex |
| --- | --- |
| Background | `#0c1226` |
| Float / statusline | `#15203b` |
| Selection | `#283867` |
| Foreground | `#e1e4ea` |
| Comments | `#8a98ba` |
| Keywords | `#ff914d` |
| Numbers / constants | `#ffc593` |
| Types | `#d8deec` |
| Functions | `#8ea2e8` |
| Strings | `#6cc69a` |
| Errors | `#f0788c` |

## Help and development

Run `:help tailwindrg.nvim` for the configuration reference. For a manual package
install, first run `:helptags ALL` to build the help index.

Run the smoke tests from the repository root:

```bash
nvim --headless -u NONE -l tests/smoke.lua
```

## License

MIT. See [LICENSE](LICENSE).
