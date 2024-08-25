local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.window_decorations = "RESIZE"
-- 取消关闭的询问
config.window_close_confirmation = "NeverPrompt"

if string.find(wezterm.target_triple, "windows") then
	-- 默认以 wsl 的形式开启
	-- config.default_domain = "WSL:Ubuntu-24.04"
	config.default_domain = "WSL:Arch"
end

config.use_fancy_tab_bar = false
config.enable_tab_bar = true
config.show_tab_index_in_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

config.font_size = 16
config.colors = {
	cursor_bg = "#b718a9",
}
config.color_scheme = "Catppuccin Mocha"
config.default_cursor_style = "BlinkingBlock"
config.cursor_blink_rate = 500

config.window_padding = {
	top = 10,
	left = 10,
	right = 10,
	-- bottom = 0,
}
-- 窗口透明度
config.window_background_opacity = 0.9
-- 标题栏透明度
config.text_background_opacity = 0.3

-- 默认开启的时候居中
wezterm.on("window-config-reloaded", function(window)
	local screen = wezterm.gui.screens()
	local screen_width, screen_height = screen.virtual_width, screen.virtual_height
	local win = window:get_dimensions()
	local win_width, win_height = win.pixel_width, win.pixel_height
	window:set_position((screen_width - win_width) / 2, (screen_height - win_height) / 2)
end)

return config
