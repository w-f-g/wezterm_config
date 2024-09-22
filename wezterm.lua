local Config = require("config")

require("config.backdrops"):set_files()
require("events.window").setup()
require("events.config_reload").setup()
require("events.format_tab_title").setup()
require("events.new_tab_button").setup()

return Config
	:init()
	:append(require("config/design"))
	:append(require("config/window"))
	:append(require("config/launch"))
	:append(require("config/domains"))
	:append(require("config/mappings"))
	.options
