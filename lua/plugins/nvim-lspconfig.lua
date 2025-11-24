return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      ["*"] = {
        keys = {
          { "K", false },
          { "gK", false },
          { "C-K", false },
          { "<M-n>", false },
          {
            "N",
            function()
              return vim.lsp.buf.hover()
            end,
            desc = "Hover",
          },
          {
            "gN",
            function()
              return vim.lsp.buf.signature_help()
            end,
            desc = "Signature Help",
            has = "signatureHelp",
          },
          {
            "<C-n>",
            function()
              return vim.lsp.buf.signature_help()
            end,
            mode = "i",
            desc = "Signature Help",
            has = "signatureHelp",
          },
          {
            "<M-k>",
            function()
              Snacks.words.jump(vim.v.count1, true)
            end,
            has = "documentHighlight",
            desc = "Next Reference",
            cond = function()
              return Snacks.words.is_enabled()
            end,
          },
        },
      },
    },
  },
}
