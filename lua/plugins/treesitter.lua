-- Treesitter provides advanced syntax highlighting, indentation, and bracket matching 
-- using Tree-sitter parsers for many programming languages.

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  dependencies = {
    "andymass/vim-matchup", -- Plugin for highlighting delimiter pairs 
  },
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "lua",
        "python",
        "javascript",
        "typescript",
        "vimdoc",
        "vim",
        "regex",
        "terraform",
        "sql",
        "toml",
        "json",
        "java",
        "groovy",
        "go",
        "gitignore",
        "yaml",
        "markdown",
        "markdown_inline",
        "bash",
        "css",
        "html",
        "rust",
        "c",
        "c_sharp",
        "ruby",
        "php",
        "perl",
        "r",
      },
      highlight = { enable = true },
      indent = { enable = true },
      rainbow = {
      enable = true,            -- enables bracket highlighting
      extended_mode = true,     -- allows brackets to also be highlighted within comments
      max_file_lines = nil,     -- does not limit the number of lines
      },
    })
  end,
}
