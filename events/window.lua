local wezterm = require("wezterm")
local mux = wezterm.mux
local M = {}

function M.setup()
	-- 默认开启的时候居中
	wezterm.on("gui-startup", function(cmd)
		local tab, pane, _window = mux.spawn_window(cmd or {})
		local window = _window:gui_window()

		local screen = wezterm.gui.screens()
		local screen_width, screen_height = screen.virtual_width, screen.virtual_height
		-- local win = window:get_dimensions()
		-- local win_width, win_height = win.pixel_width, win.pixel_height

		local win_width, win_height = 2128, 1289
		window:set_inner_size(win_width, win_height)
		window:set_position((screen_width - win_width) / 2, (screen_height - win_height) / 2 - 46)
	end)
end

return M
