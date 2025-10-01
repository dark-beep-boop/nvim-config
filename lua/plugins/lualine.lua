-- Set lualine custom theme

return {
  {
    -- Status line
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup({
        options = {
          theme = require("plugins.lualine/themes/base16"),
        },
        sections = {
          lualine_x = {
            "encoding",
            { "fileformat", symbols = { unix = "󰣇" } },
            "filetype",
          },
        },
      })
    end,
  },
}
