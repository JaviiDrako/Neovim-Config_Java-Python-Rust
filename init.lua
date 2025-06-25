-- This is my init.lua file for Neovim
-- 
-- The init.lua is the main configuration file for Neovim written in Lua.
-- It sets up core options, key mappings, and manages plugins to customize
-- and extend Neovim's functionality according to my preferences.

require 'core.options'
require 'core.keymaps'

-- Installing Lazy, plugin manager
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end
vim.opt.rtp:prepend(lazypath)

--Plugin config
require('lazy').setup({
  require('plugins.neotree'),
  require('plugins.colortheme'),
  require('plugins.bufferline'),
  require('plugins.lualine'),
  require('plugins.discord'),
  require('plugins.treesitter'),
  require('plugins.telescope'),
  require('plugins.mason'),
  require('plugins.smear-cursor'),
  require('plugins.ident-blankline'),
  require('plugins.nvim-java'),
  require('plugins.lspconfig'),
  require('plugins.nvim-dap'),
  require('plugins.dap-ui'),
  require('plugins.cmp'),
})

require('plugins.lsp')


