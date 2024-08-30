local Config = require("config")

require("events.window").setup()

return Config:init()
		:append(require("config/design"))
		:append(require("config/window"))
		:append(require("config/mappings")).options
