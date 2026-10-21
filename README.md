# lite

Minimal Neovim config for the cluster node: python scripts and HTCondor submit files.
Branch `lite` of the full config. Never merge it back: it is a stripped copy.

## What is in it
lazy.nvim, catppuccin, nvim-treesitter (highlighting), vim-sleuth, nvim-surround, which-key,
blink.cmp (words from open buffers and paths), hop, harpoon, smart-splits (tmux) and fzf-lua when
`fzf` is installed. No LSP, snippets, AI or git plugins. `*.sub`, `*.submit`, `*.condor` and `*.htc`
open as filetype `condor` (see `syntax/condor.vim`). `gc` comments, using the built-in commenting.

## Requirements
- Neovim 0.11 or newer
- `git`, a C compiler (`gcc`) and the `tree-sitter` CLI, for the treesitter parsers
  (the CLI is a single binary: put it somewhere on `PATH`)
- Optional: `fzf` for `<leader>ff`, `<leader>fg`, `<leader>fw`, `<C-p>`
- Optional: a terminal that supports OSC 52, so `<leader>y` copies to your local clipboard over ssh
  (inside tmux: `set -g set-clipboard on`)

## Install
```sh
git clone -b lite <repo-url> ~/.config/nvim
nvim   # first start installs the plugins and compiles the parsers; restart once afterwards
```
`lazy-lock.json` is committed on this branch, so the server gets the versions that were tested.

## Reset a broken install
```sh
rm -rf ~/.local/share/nvim ~/.local/state/nvim ~/.cache/nvim
```

## tmux side of smart-splits
`<C-hjkl>` and `<A-hjkl>` cross between Neovim windows and tmux panes. tmux needs matching bindings:
add `set -g @plugin 'smart-splits-nvim/backend-tmux'` (and `@smart-splits_at_edge 'split'`, to match
`move.at_edge`) to your tmux config when using TPM, or copy the `bind -n` lines from
https://github.com/smart-splits-nvim/backend-tmux. smart-splits must not be lazy loaded; it is not.
