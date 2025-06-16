require('events')

local wezterm = require('wezterm')
local config = wezterm.config_builder()

config.font = wezterm.font {
  family = 'UbuntuSansMono Nerd Font',
  weight = 'Regular',
  stretch = 'Normal',
  style = 'Normal',
}
config.font_size = 12
config.line_height = 1.1

config.initial_cols = 90
config.initial_rows = 24
config.audible_bell = 'Disabled'
config.window_decorations = 'NONE'
config.term = 'xterm-direct' -- value 'wezterm' does not work with tmux
config.bold_brightens_ansi_colors = true
config.hide_tab_bar_if_only_one_tab = true
config.enable_scroll_bar = false

config.color_scheme = 'ese_dark'

-- config.default_prog = { 'tmux' }

config.window_frame = {
  border_left_width = '1px',
  border_right_width = '1px',
  border_bottom_height = '1px',
  border_top_height = '1px',
  border_left_color = 'black',
  border_right_color = 'black',
  border_bottom_color = 'black',
  border_top_color = 'black',
}

config.window_padding = {
  left = '0px',
  right = '0px',
  top = '0px',
  bottom = '0px',
}

config.keys = {
  {
    key = 'p',
    mods = 'ALT',
    action = wezterm.action.EmitEvent('toggle_light'),
  }
}

return config
