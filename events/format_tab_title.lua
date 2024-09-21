local wezterm = require("wezterm")
local platform = require("utils.platform")
local M = {}

--[[ function basename(s)
	local a = string.gsub(s, "(.*[/\\])(.*)", "%2")
	return a:gsub("%.exe$", "")
end ]]

function M.setup()
	wezterm.on("format-tab-title", function(tab, _, _, _, _)
		local pane = tab.active_pane
		-- local title = basename(pane.foreground_process_name)

		local title = pane.domain_name
		if title == "local" and platform.is_win then
			title = "cmd"
		end
		return {
			{ Text = " " .. title .. " " },
		}
		--[[ local is_zoomed = ""
		if tab.active_pane.is_zoomed then
			is_zoomed = "z"
		end
		return {
			{ Text = " " .. tab.tab_index + 1 .. is_zoomed .. " " },
		} ]]
	end)
end

return M
