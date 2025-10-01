return {
  "neovim/nvim-lspconfig",
  opts = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    keys[#keys + 1] = { "K", false }
    keys[#keys + 1] = { "gK", false }
    keys[#keys + 1] = { "C-K", false }
    keys[#keys + 1] = { "<M-n>", false }
    keys[#keys + 1] = {
      "N",
      function()
        return vim.lsp.buf.hover()
      end,
      desc = "Hover",
    }
    keys[#keys + 1] = {
      "gN",
      function()
        return vim.lsp.buf.signature_help()
      end,
      desc = "Signature Help",
      has = "signatureHelp",
    }
    keys[#keys + 1] = {
      "<C-n>",
      function()
        return vim.lsp.buf.signature_help()
      end,
      mode = "i",
      desc = "Signature Help",
      has = "signatureHelp",
    }
    keys[#keys + 1] = {
      "<M-k>",
      function()
        Snacks.words.jump(vim.v.count1, true)
      end,
      has = "documentHighlight",
      desc = "Next Reference",
      cond = function()
        return Snacks.words.is_enabled()
      end,
    }
  end,
}
