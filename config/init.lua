local wezterm = require("wezterm")
local Config = {}

Config.__index = Config

function Config:init()
	local config = setmetatable({
		options = wezterm.config_builder(),
	}, self)
	return config
end

function Config:append(new_options)
	for k, v in pairs(new_options) do
		-- if self.options[k] == nil then
		-- 	self.options[k] = v
		-- end
		self.options[k] = v
	end
	return self
end

return Config
