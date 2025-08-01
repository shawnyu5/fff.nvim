<p align="center">
  <h2 align="center">FFF.nvim</h2>
</p>

<p align="center">
	Finally a smart fuzzy file picker for neovim.
</p>

<p align="center" style="text-decoration: none; border: none;">
	<a href="https://github.com/dmtrKovalenko/fff.nvim/stargazers" style="text-decoration: none">
		<img alt="Stars" src="https://img.shields.io/github/stars/dmtrKovalenko/fff.nvim?style=for-the-badge&logo=starship&color=C9CBFF&logoColor=D9E0EE&labelColor=302D41"></a>
	<a href="https://github.com/dmtrKovalenko/fff.nvim/issues" style="text-decoration: none">
		<img alt="Issues" src="https://img.shields.io/github/issues/dmtrKovalenko/fff.nvim?style=for-the-badge&logo=bilibili&color=F5E0DC&logoColor=D9E0EE&labelColor=302D41"></a>
	<a href="https://github.com/dmtrKovalenko/fff.nvim/contributors" style="text-decoration: none">
		<img alt="Contributors" src="https://img.shields.io/github/contributors/dmtrKovalenko/fff.nvim?color=%23DDB6F2&label=CONTRIBUTORS&logo=git&style=for-the-badge&logoColor=D9E0EE&labelColor=302D41"/></a>
</p>

**FFF** stands for ~freakin fast fuzzy file~ picker (pick 3) is an opinionated fuzzy file picker for neovim with a dedicated rust backend runtime that keep tracks about the file index, monitor for file changes, and provides comprehensive typo-resistant fuzzy search and sorts the files in a way you expect it to be sorted.

## Features

- Works out of the box with no additional configuration
- [Typo resistant fuzzy search](https://github.com/saghen/frizbee)
- Git status integration allowing to take adavantage of last modified times within a session
- Separate file index maintained by a backend allows 2-4 milliseconds search time for 50k files codebase
- Display images in previews (for now requires snacks.nvim)
- Smart in a plenty of different ways hopefully helpful for your workflow

## Installation

> [!NOTE]  
> Although we'll try to make sure to keep 100% backward compatibiility, by using should understand that silly bugs, and breaking changes may happen.
> And also we hope for your contributions and feedback to make this plugin ideal for everyone.

### Prerequisites

FFF.nvim requires:

- Neovim 0.10.0+
- Rust toolchain (requires nightly for building the native backend)

### Package Managers

#### lazy.nvim

```lua
{
  "dmtrKovalenko/fff.nvim",
  build = "cargo build --release",
  opts = {
    -- pass here all the options
  }
  keys = {
    {
      "<leader>ff", -- try it if you didn't it is a banger keybinding for a picker
      function()
        require("fff").toggle()
      end,
      desc = "Toggle FFF",
    },
  },
}
```

#### packer.nvim

```lua
use {
  'dmtrKovalenko/fff.nvim',
  requires = { 'MunifTanjim/nui.nvim' },
  run = 'cargo build --release',
  config = function()
    require("fff").setup()
  end
}
```

#### vim-plug

```vim
Plug 'MunifTanjim/nui.nvim'
Plug 'dmtrKovalenko/fff.nvim', { 'do': 'cargo build --release' }
```

### Beta configuration

I hope you'll help us to tweak the algorithm and imporve the user experience by sharing your scores and usecasese 🫡

```lua
{
  "dmtrKovalenko/fff.nvim",
  build = "cargo build --release",
  config = function()
    require("fff").setup({
      -- UI configuration
      ui = {
        width = 0.8,
        height = 0.8,
        border = "rounded",
      },
      -- File picker options
      picker = {
        ignore_patterns = { ".git/", "node_modules/", "target/" },
        show_hidden = false,
      },
      -- Frecency settings
      frecency = {
        enabled = true,
        max_entries = 2000,
      },
    })
  end,
  keys = {
    {
      "<leader>ff",
      function()
        require("fff").toggle()
      end,
      desc = "Toggle FFF",
    },
  },
}
```
