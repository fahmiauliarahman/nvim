# Codeium Inline Completions (LazyVim)

This setup enables Codeium inline ghost text while keeping `nvim-cmp` for popup
completions.

## What's enabled

- Codeium inline ghost text suggestions in Insert mode.
- Accept suggestion with `<C-l>`.
- Clear suggestion with `<C-x>`.
- `nvim-cmp` ghost text is disabled to avoid duplicate inline previews.

## Install/Update

1) Open Neovim and run `:Lazy sync`.
2) If prompted, authenticate Codeium with `:Codeium Auth`.

## Keybindings

- Accept suggestion: `<C-l>`
- Clear suggestion: `<C-x>`

## Related config files

- `lua/plugins/codeium.lua` (Codeium plugin + keybindings)
- `lua/plugins/cmp.lua` (cmp tuning and ghost text disable)

## Troubleshooting

- No ghost text: run `:Codeium Auth` and restart Neovim.
- Suggestions feel noisy: reduce typing speed or pause briefly after a few words.
- Conflicting keys: change bindings in `lua/plugins/codeium.lua`.
