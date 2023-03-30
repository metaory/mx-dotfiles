----------------------------------------------------------------------------
--- Library for getting xrdb data.
--
-- @author Yauhen Kirylau &lt;yawghen@gmail.com&gt;
-- @copyright 2015 Yauhen Kirylau
-- @submodule beautiful
----------------------------------------------------------------------------

-- Grab environment
local awesome = awesome
local screen = screen
local round = require("gears.math").round
local gears_debug = require("gears.debug")

local xresources = {}

local fallback = {
	--black
	color0 = "#000000",
	color8 = "#465457",
	--red
	color1 = "#cb1578",
	color9 = "#dc5e86",
	--green
	color2 = "#8ecb15",
	color10 = "#9edc60",
	--yellow
	color3 = "#cb9a15",
	color11 = "#dcb65e",
	--blue
	color4 = "#6f15cb",
	color12 = "#7e5edc",
	--purple
	color5 = "#cb15c9",
	color13 = "#b75edc",
	--cyan
	color6 = "#15b4cb",
	color14 = "#5edcb4",
	--white
	color7 = "#888a85",
	color15 = "#ffffff",
	--
	cursor = "#f54734",
	cx1 = "#f8f",
	cx2 = "#f8f",
	cx3 = "#f8f",
	cx4 = "#f8f",
	cx5 = "#f8f",
	cx6 = "#f8f",

	sk0 = "#f00",
	sk1 = "#f00",
	sk2 = "#f00",
	sk3 = "#f00",
	sk4 = "#f00",
	sk5 = "#f00",
	sk6 = "#f00",
	sk7 = "#f00",
	sk8 = "#f00",
	sk9 = "#f00",
	wk0 = "#0f0",
	wk1 = "#0f0",
	wk2 = "#0f0",
	wk3 = "#0f0",
	wk4 = "#0f0",
	wk5 = "#0f0",
	wk6 = "#0f0",
	wk7 = "#0f0",
	wk8 = "#0f0",
	wk9 = "#0f0",
	ek0 = "#00f",
	ek1 = "#00f",
	ek2 = "#00f",
	ek3 = "#00f",
	ek4 = "#00f",
	ek5 = "#00f",
	ek6 = "#00f",
	ek7 = "#00f",
	ek8 = "#00f",
	ek9 = "#00f",

	wbx = "#f00",
	wfx = "#f00",
	wbg = "#f00",
	wfg = "#f00",
	obg = "#f00",
	ofg = "#f00",
	sbg = "#f00",
	sfg = "#f00",
	ebg = "#f00",
	efg = "#f00",
	xbg = "#f00",
	xfg = "#f00",
	--
	background = "#0e0021",
	foreground = "#bcbcbc",
}

--- Get current base colorscheme from xrdb.
-- @treturn table Color table with keys 'background', 'foreground' and 'color0'..'color15'
function xresources.get_current_theme()
	local keys = {
		"cx1",
		"cx2",
		"cx3",
		"cx4",
		"cx5",
		"cx6",

		"c00",
		"c01",
		"c02",
		"c03",
		"c04",
		"c05",
		"c06",
		"c07",
		"c08",
		"c09",
		"c10",
		"c11",
		"c12",
		"c13",
		"c14",
		"c15",

		"sk0",
		"sk1",
		"sk2",
		"sk3",
		"sk4",
		"sk5",
		"sk6",
		"sk7",
		"sk8",
		"sk9",
		"wk0",
		"wk1",
		"wk2",
		"wk3",
		"wk4",
		"wk5",
		"wk6",
		"wk7",
		"wk8",
		"wk9",
		"ek0",
		"ek1",
		"ek2",
		"ek3",
		"ek4",
		"ek5",
		"ek6",
		"ek7",
		"ek8",
		"ek9",

		"wbx",
		"wfx",
		"wbg",
		"wfg",
		"obg",
		"ofg",
		"sbg",
		"sfg",
		"ebg",
		"efg",
		"xbg",
		"xfg",
		"cursor",
		"background",
		"foreground",
	}
	for i = 0, 15 do
		table.insert(keys, "color" .. i)
	end
	local colors = {}
	for _, key in ipairs(keys) do
		local color = awesome.xrdb_get_value("", key)
		if color then
			if color:find("rgb:") then
				color = "#" .. color:gsub("[a]?rgb:", ""):gsub("/", "")
			end
		else
			gears_debug.print_warning(
				"beautiful: can't get colorscheme from xrdb for value '" .. key .. "' (using fallback)."
			)
			color = fallback[key]
		end
		colors[key] = color
	end
	return colors
end

local function get_screen(s)
	return s and screen[s]
end

--- Get global or per-screen DPI value falling back to xrdb.
--
-- This function is deprecated. Use `s.dpi` and avoid getting the DPI without
-- a screen.
--
-- @deprecated xresources.get_dpi
-- @tparam[opt] integer|screen s The screen.
-- @treturn number DPI value.

function xresources.get_dpi(s)
	s = get_screen(s)
	if s then
		return s.dpi
	end
	if not xresources.dpi then
		-- Might not be present when run under unit tests
		if awesome and awesome.xrdb_get_value then
			xresources.dpi = tonumber(awesome.xrdb_get_value("", "Xft.dpi"))
		end
		-- Following Keith Packard's whitepaper on Xft,
		-- https://keithp.com/~keithp/talks/xtc2001/paper/xft.html#sec-editing
		-- the proper fallback for Xft.dpi is the vertical DPI reported by
		-- the X server. This will generally be 96 on Xorg, unless the user
		-- has configured it differently
		if not xresources.dpi then
			if root then
				local mm_to_inch = 25.4
				local _, h = root.size()
				local _, hmm = root.size_mm()
				if hmm ~= 0 then
					xresources.dpi = round(h * mm_to_inch / hmm)
				end
			end
		end
		-- ultimate fallback
		if not xresources.dpi then
			xresources.dpi = 96
		end
	end
	return xresources.dpi
end

--- Set DPI for a given screen (defaults to global).
-- @tparam number dpi DPI value.
-- @tparam[opt] integer s Screen.
function xresources.set_dpi(dpi, s)
	s = get_screen(s)
	if not s then
		xresources.dpi = dpi
	else
		s.dpi = dpi
	end
end

--- Compute resulting size applying current DPI value (optionally per screen).
-- @tparam number size Size
-- @tparam[opt] integer|screen s The screen.
-- @treturn integer Resulting size (rounded to integer).
function xresources.apply_dpi(size, s)
	return round(size / 96 * xresources.get_dpi(s))
end

return xresources

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
