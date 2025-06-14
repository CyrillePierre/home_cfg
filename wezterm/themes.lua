local wezterm = require('wezterm')
local M = {}

-- default to dark theme if wezterm.gui is not available (mux server)
local function select_scheme()
  if wezterm.gui and wezterm.gui.get_appearance():find('Light') then
    return 'ese_light'
  end
  return 'ese_dark'
end

function M.apply_for_config(config)
  config.color_schemes = wezterm.color.get_builtin_schemes()
  config.color_schemes.ese_dark = require('colors.ese_dark')
  config.color_schemes.ese_light = require('colors.ese_light')
  config.color_scheme = select_scheme()
end

return M
