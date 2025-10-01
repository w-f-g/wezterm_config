local platform = require("utils.platform")

local options = {
	-- default_prog = {},
	launch_menu = {},
}

if platform.is_win then
	options.default_prog = { "cmd" }
	options.launch_menu = {
		-- { label = "PowerShell Desktop", args = { "powershell" } },
		-- { label = "Command Prompt", args = { "cmd" } },
		{ label = "Docker:Arch", args = { "ssh", "root@localhost", "-p", "2222" } },
	}
end

return options
