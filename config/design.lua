local wezterm = require("wezterm")
local design_config = {}

design_config.font_size = 16
design_config.colors = {
	cursor_bg = "#b718a9",
}
design_config.color_scheme = "Catppuccin Mocha"
design_config.default_cursor_style = "BlinkingBlock"
design_config.cursor_blink_rate = 500

-- design_config.background = {
-- 	{
-- 		source = { File = bg_images[6] },
-- 		height = "Cover",
-- 		opacity = 0.5,
-- 	},
-- }

return design_config
