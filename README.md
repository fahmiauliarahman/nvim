# ⚙️ LazyVim Configuration

Personal Neovim setup built on top of [LazyVim](https://github.com/LazyVim/LazyVim). It focuses on strong language-server coverage for day-to-day backend/web development (Go, Python, PHP, TypeScript, Java) plus the DevOps tooling I touch the most (YAML, Docker, Helm, JSON). Lazy.nvim handles plugin management, so the config stays lean and reproducible.

## Requirements

- Neovim 0.9+ (or nightly) with LuaJIT support
- Git, curl/wget, unzip (for lazy.nvim bootstrapping)
- Build tools required by language servers you enable (Go, Python, Node.js, Java, etc.)

Optional but recommended:

- A Nerd Font (for icons in the UI)
- `ripgrep` and `fd` so pickers/Telescope-style workflows stay fast

## Installation

```bash
mv ~/.config/nvim ~/.config/nvim.backup   # keep your previous config
git clone https://github.com/fahmiauliarahman/nvim ~/.config/nvim
rm -rf .git
nvim                                     # lazy.nvim will bootstrap automatically
```

The first start downloads lazy.nvim and the plugins specified in `lua/plugins`. After the sync finishes, restart Neovim once so all LSP servers and formatters Mason installs are detected.

## Highlights

- **Language Servers** – Imports LazyVim extras for Go, Python (Pyright + Ruff), PHP, TypeScript, and Java. DevOps extras cover YAML, Docker, Helm, and JSON.
- **Debugging-ready** – `lazyvim.plugins.extras.dap.core` gives you nvim-dap UI, adapters, and keymaps out of the box.
- **Opinionated formatting** – `stevearc/conform.nvim` runs `ruff_format` first for Python, falling back to Black. Prettier is forced available even without a project config for JS/TS/MD, and LazyVim’s Black extra is enabled for consistency.
- **File management** – [`folke/snacks.nvim`](lua/plugins/snacks.lua) powers the explorer and picker. Dotfiles are visible while common noise (`node_modules`, build artifacts, local venvs) stays hidden in both the sidebar and picker sources.
- **UI / themes** – TokyoNight Night is the default colorscheme with Catppuccin Mocha ready as an alternative (`lua/plugins/themes.lua`). Startup disables unused runtime plugins for faster launch.
- **Quality-of-life tweaks** – Half-page scrolling keeps the cursor centered (`<C-d>`/`<C-u>` mapped in `lua/config/keymaps.lua`). Global options favor Pyright and Ruff for Python and allow running Prettier without a local config.

## Repository Layout

```
init.lua                     -- bootstraps lazy.nvim via lua/config/lazy.lua
lua/config/
  lazy.lua                   -- core Lazy setup + plugin imports
  options.lua                -- additional global options (LSP + formatter prefs)
  keymaps.lua                -- custom keybindings layered on LazyVim defaults
lua/plugins/
  conform.lua                -- formatter settings per filetype
  snacks.lua                 -- explorer/picker rules
  themes.lua                 -- theme configuration and defaults
stylua.toml                  -- formatter settings for Lua files
lazy-lock.json               -- lockfile for reproducible plugin versions
```

## Customization Tips

- Override or extend plugins by adding new files under `lua/plugins/`. Lazy.nvim will automatically pick them up.
- Use `:Lazy` to update plugins, check for issues, or remove unused specs.
- Manage tooling via `:Mason` (everything specified in the extras will auto-install, but you can add more).
- Keep formatting consistent: run `stylua .` before committing Lua changes.

## Troubleshooting

- If lazy.nvim fails to install, ensure `git` and `curl` are on your PATH and rerun `nvim`.
- When LSP servers are missing, open `:Mason` and verify the installer logs. Most extras install servers automatically, but JVM-based tools may require `java` on PATH.
- For UI glitches after updating plugins, run `:Lazy sync`, restart Neovim, and (if needed) delete `~/.local/share/nvim/lazy` to trigger a clean reinstall.

Enjoy, and feel free to fork/tweak anything—LazyVim makes experimentation painless.
