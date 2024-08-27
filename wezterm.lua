local Config = require("config")

require("events.window_position").setup()

return Config:init()
	:append(require("config/design"))
	:append(require("config/window"))
	:append(require("config/mappings")).options
