local wezterm = require("wezterm")
local platform = require("utils.platform")
local M = {}

function M.setup()
	-- 自定义添加标签页
	wezterm.on("new-tab-button-click", function(window, pane, button, default_action)
		if default_action and button == "Left" then
			window:perform_action(default_action, pane)
		end

		if platform.is_win and default_action and button == "Right" then
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
