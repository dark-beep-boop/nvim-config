return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    window = {
      mappings = {
        ["s"] = "open",
        ["h"] = "close_node",
        ["t"] = "none",
        ["n"] = "none",
        ["V"] = "open_vsplit",
        ["S"] = "open_split",
        ["H"] = "toggle_hidden",
        ["l"] = "none",
        ["j"] = "open_tabnew",
      },
    },
  },
}
