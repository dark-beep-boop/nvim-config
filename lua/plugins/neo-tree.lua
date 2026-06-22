return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "s1n7ax/nvim-window-picker",
    config = function ()
      require("window-picker").setup()
    end
  },
  opts = {
    window = {
      mappings = {
        ["h"] = "close_node",
        ["t"] = "none",
        ["n"] = "none",
        ["s"] = "focus_preview",
        ["V"] = "open_vsplit",
        ["S"] = "open_split",
        ["H"] = "toggle_hidden",
        ["l"] = "none",
        ["j"] = "open_tabnew",
      },
    },
    filesystem = {
      window = {
        mappings = {
          ["<C-s>"] = "none",
        },
      },
    },
  },
}
