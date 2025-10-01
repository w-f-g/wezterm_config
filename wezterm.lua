local Config = require("config")
local platform = require("utils.platform")

require("config.backdrops"):set_files()
require("events.new_tab_button").setup()
require("events.format_tab_title").setup()

if platform.is_win then
	require("events.window").setup()
	require("events.config_reload").setup()
end

return Config:init()
	:append(require("config/design"))
	:append(require("config/window"))
	:append(require("config/launch"))
	:append(require("config/domains"))
	:append(require("config/mappings")).options
