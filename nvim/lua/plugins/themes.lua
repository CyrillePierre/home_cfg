return {
  {
    'rebelot/kanagawa.nvim',
    opts = {
      theme = "wave",              -- Load "wave" theme when 'background' option is not set
      background = {               -- map the value of 'background' option to a theme
        dark = "wave",           -- try "dragon" !
        light = "lotus"
      },
    },
  },
  {
    'CyrillePierre/ese-colors.nvim',
    dependencies = {'nvim-lualine/lualine.nvim'},
    opts = {
      configure_lualine = true,
      set_default_background = false,
    },
  },
}
