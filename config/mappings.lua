local wezterm = require("wezterm")
local backdrops = require("config.backdrops")
local action = wezterm.action
local mappings_config = {}

mappings_config.leader = { key = "a", mods = "CTRL", timeout_Milliseconds = 1000 }
mappings_config.keys = {
	-- { key = "", mods = "", action = action. },
	{ key = "q", mods = "CTRL", action = action.QuitApplication },
	{ key = "j", mods = "ALT", action = action.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "l", mods = "ALT", action = action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "q", mods = "LEADER", action = action.CloseCurrentPane({ confirm = false }) },
	{ key = "h", mods = "LEADER", action = action.ActivatePaneDirection("Left") },
	{ key = "j", mods = "LEADER", action = action.ActivatePaneDirection("Down") },
	{ key = "k", mods = "LEADER", action = action.ActivatePaneDirection("Up") },
	{ key = "l", mods = "LEADER", action = action.ActivatePaneDirection("Right") },
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
}

return mappings_config
