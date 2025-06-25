-- Colortheme gruvbox-material

return {
  "sainnhe/gruvbox-material",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd("let g:gruvbox_material_background = 'medium'") -- Variantes: soft, medium, hard
    vim.cmd("colorscheme gruvbox-material")
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  end,
}
