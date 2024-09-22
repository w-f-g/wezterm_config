return {
	-- ref: https://wezfurlong.org/wezterm/config/lua/SshDomain.html
	ssh_domains = {
		--[[ {
			name = "Docker:Arch",
			remote_address = "localhost",
			username = "root",
			ssh_option = {
				port = "2222",
			},
		}, ]]
	},

	-- ref: https://wezfurlong.org/wezterm/multiplexing.html#unix-domains
	unix_domains = {},

	-- ref: https://wezfurlong.org/wezterm/config/lua/WslDomain.html
	wsl_domains = {
		{
			name = "WSL:Arch",
			distribution = "Arch",
			username = "strange",
			default_cwd = "~",
			-- default_prog = { 'zsh', '-l' },
		},
	},
}
