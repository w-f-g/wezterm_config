local wezterm = require("wezterm")
local backdrops = require("config.backdrops")
local action = wezterm.action
local mappings_config = {}

mappings_config.leader = { key = "a", mods = "CTRL", timeout_Milliseconds = 1000 }
mappings_config.keys = {
	-- { key = "", mods = "", action = action. },
	{ key = "q",          mods = "CTRL",   action = action.QuitApplication },
	{
		key = "n",
		mods = "ALT",
		action = action.ShowLauncherArgs({
			title = "Select/Search:",
			flags = "FUZZY|LAUNCH_MENU_ITEMS|DOMAINS",
		}),
	},
	{ key = "=",          mods = "ALT",    action = action.ActivateTabRelative(1) },
	{ key = "-",          mods = "ALT",    action = action.ActivateTabRelative(-1) },
	{ key = "f",          mods = "ALT",    action = action.ToggleFullScreen },
	{ key = "]",          mods = "ALT",    action = action.MoveTabRelative(1) },
	{ key = "[",          mods = "ALT",    action = action.MoveTabRelative(-1) },
	{ key = "k",          mods = "ALT",    action = action.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "l",          mods = "ALT",    action = action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "LeftArrow",  mods = "ALT",    action = action.AdjustPaneSize({ "Left", 5 }) },
	{ key = "RightArrow", mods = "ALT",    action = action.AdjustPaneSize({ "Right", 5 }) },
	{ key = "UpArrow",    mods = "ALT",    action = action.AdjustPaneSize({ "Up", 5 }) },
	{ key = "DownArrow",  mods = "ALT",    action = action.AdjustPaneSize({ "Down", 5 }) },

	{ key = "q",          mods = "LEADER", action = action.CloseCurrentPane({ confirm = false }) },
	{ key = "h",          mods = "LEADER", action = action.ActivatePaneDirection("Left") },
	{ key = "j",          mods = "LEADER", action = action.ActivatePaneDirection("Down") },
	{ key = "k",          mods = "LEADER", action = action.ActivatePaneDirection("Up") },
	{ key = "l",          mods = "LEADER", action = action.ActivatePaneDirection("Right") },
	{
		key = "b",
		mods = "LEADER",
		action = action.InputSelector({
			title = "Select Background",
			choices = backdrops:choices(),
			fuzzy = true,
			fuzzy_description = "Select Background: ",
			action = wezterm.action_callback(function(window, _pane, idx)
				backdrops:set_img(window, tonumber(idx))
			end),
		}),
	},
	-- 添加子窗口
	{
		key = "t",
		mods = "LEADER",
		action = wezterm.action_callback(function(_window, _pane, _idx)
			-- local cwd_uri = pane:get_current_working_dir()
			-- local cwd = cwd_uri.file_path
			wezterm.background_child_process({
				"wezterm-gui",
				"--config-file",
				wezterm.config_dir .. "\\mini_wezterm.lua",
			})
		end),
	},
}

mappings_config.mouse_bindings = {
	-- 禁用鼠标点击跳转链接
	--[[ {
		event = { Up = { streak = 1, button = "Left" } },
		mods = "NONE",
		action = action.CompleteSelection("ClipboardAndPrimarySelection"),
	}, ]]
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "NONE",
		action = wezterm.action.DisableDefaultAssignment,
	},
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "CTRL",
		action = action.OpenLinkAtMouseCursor,
	},
	{
		event = { Down = { streak = 1, button = "Left" } },
		mods = "CTRL",
		action = wezterm.action.Nop,
	},
}

return mappings_config
