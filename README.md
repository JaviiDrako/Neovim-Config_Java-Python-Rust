
# Neovim Configuration

This is my personal Neovim configuration optimized for development in Java, Python, and Rust. It includes integrated LSP support, debugging UI, and various plugins to enhance productivity and editing experience.

## Project Structure 🗂️
```
nvim/
├── init.lua               # Main configuration file where plugins are loaded and core settings applied
└── lua/
    ├── core/              # Core settings and key mappings
    │   ├── keymaps.lua    # Custom key mappings
    │   └── options.lua    # General Neovim options and settings
    └── plugins/           # Individual plugin configurations
        ├── bufferline.lua
        ├── cmp.lua
        ├── colortheme.lua
        ├── dap-ui.lua
        ├── discord.lua
        ├── ident-blankline.lua
        ├── lspconfig.lua
        ├── lsp.lua
        ├── lualine.lua
        ├── mason.lua
        ├── neotree.lua
        ├── nvim-dap.lua
        ├── nvim-java.lua
        ├── smear-cursor.lua
        ├── telescope.lua
        └── treesitter.lua

```


## How It Works ⚙️

- Each plugin is configured in its own Lua file inside the `lua/plugins/` directory.
- Core Neovim options and key mappings are defined in `lua/core/options.lua` and `lua/core/keymaps.lua`.
- The `init.lua` file is responsible for loading core settings and setting up plugins using the Lazy.nvim plugin manager.
- Plugins are imported and initialized by requiring their respective files in the `lazy.setup()` call inside `init.lua`.

## How and Where to Make Changes ✍️

- **Options and Keymaps:**  
  Modify general Neovim settings in `lua/core/options.lua` and custom key mappings in `lua/core/keymaps.lua`.

- **Plugins:**  
  To add or customize a plugin, create a new Lua file inside the `lua/plugins/` directory named after the plugin (e.g., `example-plugin.lua`). Inside that file, return a Lua table with the plugin specification. Then, import this file in the `require('lazy').setup({ ... })` call within `init.lua` to activate it.

Example plugin file (`lua/plugins/example-plugin.lua`):

```lua
return {
"author/example-plugin",
opts = {
-- plugin-specific options here
},
}
```

And in `init.lua`:

```lua
require('lazy').setup({
-- other plugins...
require('plugins.example-plugin'),
})
```


## Features ✨

- Language Server Protocol (LSP) support for Java, Python, and Rust.
- Debugger UI integration for streamlined debugging.
- File explorer, fuzzy finder, status line, and other UI enhancements.
- Smooth cursor effects and visible indentation guides.
- Snippet support and autocompletion.

## Installation 📥

1. Clone this repository into your Neovim configuration directory (usually `~/.config/nvim`).
2. Open Neovim, and Lazy.nvim will automatically install and set up the plugins.
3. Customize keymaps and options as needed in the `lua/core/` directory.
---

Thanks for checking out the repo! ⭐ If you found it helpful or interesting, consider giving it a star on GitHub.
