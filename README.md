<div align="center">

# Scribe

#### Note taking plugin for neovim

[![Lua](https://img.shields.io/badge/Lua-blue.svg?style=for-the-badge&logo=lua)](http://www.lua.org)
[![Neovim](https://img.shields.io/badge/Neovim-57A143?logo=neovim&logoColor=white&style=for-the-badge)](https://neovim.io)


</div>

## Features

* open project notes in floating window
* append line under cursor or visual range to notes
* autosave on close

## Instalation

Install the plugin with your preferred package manager:

```lua
-- lazy.nvim
{
  "avienithari/scribe"
}
```

## Setup
Here are basic remaps for scribe:
```lua
vim.keymap.set("n", "<leader>o", ":ScribeOpen<CR>") -- open scribe
vim.keymap.set("n", "<leader>c", ":ScribeClose<CR>") -- close scribe
vim.keymap.set("n", "<leader>n", ":ScribeToggle<CR>") -- toggle scribe
vim.keymap.set("n", "<leader>A", ":ScribeLine<CR>") -- append line
vim.keymap.set("v", "<leader>a", ":ScribeRange<CR>") -- append range
```

## Documentation

See `:help scribe`
