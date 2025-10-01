local wezterm = require("wezterm")
local platform = require("utils.platform")
local M = {}

function tab_title(tab_info)
	local pane = tab_info.active_pane

	local title = pane.domain_name
	if title == "local" and platform.is_win then
		title = "cmd"
	else
		title = tab_info.tab_index + 1
	end

	return title
end

function M.setup()
	wezterm.on("format-tab-title", function(tab, _, _, _, _)
		local title = tab_title(tab)
		return {
			{ Text = " " .. title .. " " },
		}
	end)
end

return M
