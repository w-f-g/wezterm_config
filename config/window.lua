local wezterm = require("wezterm")
local window_config = {}

-- window_config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
window_config.window_decorations = "NONE"
-- 取消关闭的询问
window_config.window_close_confirmation = "NeverPrompt"

window_config.use_fancy_tab_bar = false
window_config.enable_tab_bar = true
window_config.show_tab_index_in_tab_bar = false
window_config.hide_tab_bar_if_only_one_tab = true

window_config.window_padding = {
	top = "0",
	left = "0",
	right = "0",
	bottom = "0",
}
window_config.initial_cols = 108
window_config.initial_rows = 26

-- 窗口不透明度
window_config.window_background_opacity = 0.8
-- 文本背景不透明度
window_config.text_background_opacity = 0.8

if string.find(wezterm.target_triple, "windows") then
	window_config.default_cwd = "D:\\"
	-- 默认以 wsl 的形式开启
	window_config.default_domain = "WSL:Arch"
	window_config.background = {
		{
			source = { File = "C:\\Users\\strange\\.config\\wezterm\\bg\\bg_01.jpg" },
			horizontal_align = "Center",
		},
		{
			source = { Color = "#1e1e2e" },
			height = "100%",
			width = "100%",
			opacity = 0.4,
		},
	}
	window_config.window_decorations = "RESIZE"
	window_config.initial_cols = 118
	window_config.initial_rows = 30
end

return window_config
