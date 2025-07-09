local wezterm = require('wezterm')

wezterm.on('toggle_light', function(window, _)
  local overrides = window:get_config_overrides() or {}
  if not overrides.color_scheme then
    overrides.color_scheme = 'ese_light'
  else
    overrides.color_scheme = nil
  end
  window:set_config_overrides(overrides)
end)

wezterm.on('enable_light', function(window, _)
  local overrides = window:get_config_overrides() or {}
  overrides.color_scheme = 'ese_light'
  window:set_config_overrides(overrides)
end)

wezterm.on('disable_light', function(window, _)
  local overrides = window:get_config_overrides() or {}
  overrides.color_scheme = nil
  window:set_config_overrides(overrides)
end)

wezterm.on('user-var-changed', function(window, pane, name, value)
  local overrides = window:get_config_overrides() or {}
  if name == 'theme' then
    overrides.color_scheme = 'ese_' .. value
  end
  window:set_config_overrides(overrides)
end)
