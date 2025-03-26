local wezterm = require("wezterm")
local design_config = {}

design_config.animation_fps = 60
design_config.max_fps = 60
design_config.font = wezterm.font("FiraCode Nerd Font")
design_config.font_size = 16
design_config.colors = {
	cursor_bg = "#b718a9",
	tab_bar = {
		background = "#1e1e2e",
	},
}

-- 见 https://github.com/catppuccin/wezterm
design_config.color_scheme = "Catppuccin Mocha"
design_config.default_cursor_style = "BlinkingBlock"
design_config.cursor_blink_rate = 500

design_config.hyperlink_rules = wezterm.default_hyperlink_rules()

return design_config
