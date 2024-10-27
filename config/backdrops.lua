local wezterm = require("wezterm")
local colors = wezterm.color.get_default_colors()
local BackDrops = {}
BackDrops.__index = BackDrops

function BackDrops:init()
	local inital = {
		current_idx = 1,
		files = {},
	}
	local backdrops = setmetatable(inital, self)
	wezterm.GLOBAL.background = nil
	return backdrops
end

--[[ function BackDrops:set_files()
	local bg_images = {}
	local handle = io.popen('dir /b /s "C:\\Users\\wang\\.config\\wezterm\\bg"')
	for file in handle:lines() do
		table.insert(bg_images, file)
	end
	self.files = bg_images
	wezterm.GLOBAL.background = self.files[1]
	return self
end ]]

function BackDrops:set_files()
	self.files = wezterm.read_dir(wezterm.config_dir .. "\\bg")
	wezterm.GLOBAL.background = self.files[1]
	return self
end

function BackDrops:_set_opt(window)
	local opts = {
		background = {
			{
				source = { File = wezterm.GLOBAL.background },
				horizontal_align = "Center",
			},
			{
				source = { Color = "#1e1e2e" },
				height = "100%",
				width = "100%",
				opacity = 0.3,
			},
		},
	}
	--[[ if wezterm.GLOBAL.background ~= nil then
		opts.window_background_opacity = 0.8
		opts.text_background_opacity = 0.8
	end ]]
	window:set_config_overrides(opts)
end

function BackDrops:choices()
	local choices = {}
	for idx, file in ipairs(self.files) do
		local name = file:match("([^\\]+)$")
		table.insert(choices, {
			id = tostring(idx),
			label = name,
		})
	end
	return choices
end

function BackDrops:set_img(window, idx)
	if idx > #self.files or idx < 0 then
		-- wezterm.log_error("Index out of range")
		return
	end

	self.current_idx = idx
	if idx == 1 then
		wezterm.GLOBAL.background = nil
	else
		wezterm.GLOBAL.background = self.files[idx]
	end
	self:_set_opt(window)
end

return BackDrops:init()
