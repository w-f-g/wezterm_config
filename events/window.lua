local wezterm = require("wezterm")
local M = {}

function M.setup()
	-- 默认开启的时候居中
	wezterm.on("window-config-reloaded", function(window)
		local screen = wezterm.gui.screens()
		local screen_width, screen_height = screen.virtual_width, screen.virtual_height
		local win = window:get_dimensions()
		local win_width, win_height = win.pixel_width, win.pixel_height
		window:set_position((screen_width - win_width) / 2, (screen_height - win_height) / 2)
	end)
end

return M
