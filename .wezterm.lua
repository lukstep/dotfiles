local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- Font
config.font = wezterm.font('VictorMono Nerd Font Propo',  {})
config.font_size = 15

-- Window
config.enable_tab_bar = false
config.window_decorations = "RESIZE"

-- Color scheme
config.color_scheme = "Kanagawa (Gogh)"
config.window_background_opacity = 0.9
config.macos_window_background_blur = 10

return config
