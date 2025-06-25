-- A customizable file explorer for Neovim that lets you browse and manage your 
-- filesystem and other tree-like structures.

return{
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  opts = {
    filesystem = {
      show_hidden = true,
      filtered_items = {
        visible = true, 
      },
    },
    window = {
      mappings = {
        ["k"] = "navigate_left",
        ["l"] = "navigate_down",
        ["ñ"] = "navigate_right",
        ["h"] = "navigate_up",
        ["o"] = "move-up",
        ["od"] = "",  
        ["os"] = "", 
        ["og"] = "",
        ["on"] = "",
        ["oc"] = "",  
        ["om"] = "", 
        ["ot"] = "",
      },
    },
  },
}
