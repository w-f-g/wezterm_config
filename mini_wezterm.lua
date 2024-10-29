local wezterm = require("wezterm")
local Config = require("config")
local action = wezterm.action
local mux = wezterm.mux

wezterm.on("gui-startup", function(cmd)
	local _, _, _window = mux.spawn_window(cmd or {})
	local window = _window:gui_window()

	local screen = wezterm.gui.screens()
	local screen_width, screen_height = screen.virtual_width, screen.virtual_height
	local win = window:get_dimensions()
	local win_width, win_height = win.pixel_width, win.pixel_height

	window:set_position((screen_width - win_width) / 2, (screen_height - win_height) / 2 - 46)
end)

require("events.format_tab_title").setup()

return Config:init()
	:append(require("config/design"))
	:append(require("config/window"))
	:append(require("config/launch"))
	:append(require("config/domains"))
	:append({
		initial_cols = 80,
		initial_rows = 24,
		keys = {
			{ key = "q", mods = "CTRL", action = action.CloseCurrentPane({ confirm = false }) },
			{
				key = "n",
				mods = "ALT",
				action = action.ShowLauncherArgs({
					title = "Select/Search:",
					flags = "FUZZY|LAUNCH_MENU_ITEMS|DOMAINS",
				}),
			},
			{ key = "=", mods = "ALT", action = action.ActivateTabRelative(1) },
			{ key = "-", mods = "ALT", action = action.ActivateTabRelative(-1) },
			{ key = "]", mods = "ALT", action = action.MoveTabRelative(1) },
			{ key = "[", mods = "ALT", action = action.MoveTabRelative(-1) },
		},
	}).options
