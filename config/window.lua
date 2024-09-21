local wezterm = require("wezterm")
local window_config = {}

window_config.window_decorations = "RESIZE"
-- 取消关闭的询问
window_config.window_close_confirmation = "NeverPrompt"

if string.find(wezterm.target_triple, "windows") then
	-- 默认以 wsl 的形式开启
	-- window_config.default_domain = "WSL:Ubuntu-24.04"
	window_config.default_domain = "WSL:Arch"
end

window_config.use_fancy_tab_bar = false
window_config.enable_tab_bar = true
window_config.show_tab_index_in_tab_bar = false
window_config.hide_tab_bar_if_only_one_tab = true

window_config.window_padding = {
	top = 0,
	left = 0,
	right = 0,
	bottom = 0,
}
-- 窗口透明度
window_config.window_background_opacity = 0.9
-- 标题栏透明度
window_config.text_background_opacity = 0.9

return window_config
