local wezterm = require("wezterm")
local M = {}

function M.setup()
	wezterm.on("new-tab-button-click", function(window, pane, button, default_action)
		if default_action and button == "Left" then
			window:perform_action(default_action, pane)
		end

		if default_action and button == "Right" then
			window:perform_action(
				wezterm.action.ShowLauncherArgs({
					title = "Select/Search:",
					flags = "FUZZY|DOMAINS|LAUNCH_MENU_ITEMS",
				}),
				pane
			)
		end
		return false
	end)
end

return M