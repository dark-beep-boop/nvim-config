return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    window = {
      mappings = {
        ["s"] = "open",
        ["h"] = "close_node",
        ["t"] = "'j'",
        ["n"] = "'k'",
        ["S"] = "open_vsplit",
        ["<M-S>"] = "open_vsplit",
        ["l"] = "none",
        ["j"] = "open_tabnew",
      },
    },
  },
}
