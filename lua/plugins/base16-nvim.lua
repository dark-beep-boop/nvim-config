-- Sets a base16 colorscheme

return {
  {
    -- Color theme
    "dark-beep-boop/base16-nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("base16-current")
    end,
  },
}
