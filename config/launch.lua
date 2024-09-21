local platform = require("utils.platform")

local options = {
	default_prog = {},
	launch_menu = {},
}

if platform.is_win then
	options.default_prog = { "cmd" }
	options.launch_menu = {
		-- { label = "PowerShell Desktop", args = { "powershell" } },
		{ label = "Command Prompt", args = { "cmd" } },
		-- { label = "Command Prompt", args = { "C:\\WINDOWS\\System32\\cmd.exe" } },
	}
end

return options
