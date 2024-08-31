local Config = require("config")

require("config.backdrops"):set_files()
require("events.window").setup()

return Config:init()
		:append(require("config/design"))
		:append(require("config/window"))
		:append(require("config/mappings")).options
