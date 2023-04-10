local awful = require("awful")
local gears = require("gears")
local thm = require("beautiful")

local _mv_margins = { left = 8, right = 8, top = 8, bottom = 52 }
local _mv_offset = { x = 5, y = 5 }
local _inc_by = 30
local _min_size = 200

local _wm = {}

_wm.relative_screen_focus = function(offset)
	return function()
		awful.screen.focus_relative(offset)
	end
end
_wm.relative_client_focus = function(offset)
	return function()
		awful.client.focus.byidx(offset)
	end
end

_wm.mv_bottom_left = function()
	return function()
		if client.focus.floating or awful.layout.getname() == "floating" and not client.focus.maximized then
			awful.placement.scale(client.focus, { to_percent = 0.46 })
			awful.placement.bottom_left(
				client.focus,
				{ honor_padding = true, honor_workarea = true, margins = _mv_margins, offset = _mv_offset }
			)
		else
			awful.client.swap.byidx(1)
		end
	end
end

_wm.mv_bottom_right = function()
	return function()
		if client.focus.floating or awful.layout.getname() == "floating" and not client.focus.maximized then
			awful.placement.scale(client.focus, { to_percent = 0.46 })
			awful.placement.bottom_right(
				client.focus,
				{ honor_padding = true, honor_workarea = true, margins = _mv_margins, offset = { x = -10, y = 5 } }
			)
		else
			awful.client.swap.byidx(-1)
		end
	end
end

_wm.mv_top_left = function()
	return function()
		if client.focus.floating or awful.layout.getname() == "floating" and not client.focus.maximized then
			awful.placement.scale(client.focus, { to_percent = 0.46 })
			awful.placement.top_left(
				client.focus,
				{ honor_padding = true, honor_workarea = true, margins = _mv_margins, offset = _mv_offset }
			)
		else
			awful.tag.incnmaster(1, nil, true)
		end
	end
end

_wm.mv_top_right = function()
	return function()
		if client.focus.floating or awful.layout.getname() == "floating" and not client.focus.maximized then
			awful.placement.scale(client.focus, { to_percent = 0.46 })
			awful.placement.top_right(
				client.focus,
				{ honor_padding = true, honor_workarea = true, margins = _mv_margins, offset = { x = -10, y = 5 } }
			)
		else
			awful.tag.incnmaster(-1, nil, true)
		end
	end
end
-- /////////////////////////////////////////////////////////////// --
_wm.dech = function()
	return function() --[[ k ]]
		if client.focus.floating or awful.layout.getname() == "floating" then
			local cgeo = client.focus:geometry()
			local swrk = client.focus.screen.workarea
			local ugeo = { x = cgeo.x, y = cgeo.y, width = cgeo.width, height = (cgeo.height - _inc_by) }
			ugeo.y = ugeo.y < swrk.y and swrk.y or ugeo.y
			ugeo.height = ugeo.height > swrk.height and swrk.height or ugeo.height
			ugeo.height = ugeo.height > _min_size and ugeo.height or _min_size
			mdbg_t(client.focus.screen.geometry, "sgeo")
			mdbg_t(swrk, "swrk")
			mdbg_t(cgeo, "cgeo")
			mdbg_t(ugeo, "ugeo")
			client.focus:geometry(ugeo)
		else
			mdbg_p("resize incwfact")
			awful.client.incwfact(-0.01)
		end
	end
end

_wm.inch = function()
	return function() --[[ j ]]
		if client.focus.floating or awful.layout.getname() == "floating" then
			local cgeo = client.focus:geometry()
			local sgeo = client.focus.screen.geometry
			local swrk = client.focus.screen.workarea
			local cgap = client.focus.border_width
			local sgap = thm.useless_gap

			local ugeo = {
				x = cgeo.x,
				y = (cgeo.y + cgeo.height + cgap + _inc_by) > (sgeo.height - cgap) and (cgeo.y - _inc_by) or cgeo.y,
				width = cgeo.width,
				height = (cgeo.height + _inc_by),
			}
			ugeo.y = ugeo.y < swrk.y and swrk.y or ugeo.y
			ugeo.height = (ugeo.height + (cgap * 2)) >= swrk.height and (swrk.height - cgap) or ugeo.height
			client.focus:geometry(ugeo)
		else
			mdbg_p("resize incwfact")
			awful.client.incwfact(0.01)
		end
	end
end

_wm.incw = function()
	return function() --[[ l ]]
		if client.focus.floating or awful.layout.getname() == "floating" then
			local cgeo = client.focus:geometry()
			local sgeo = client.focus.screen.geometry
			local swrk = client.focus.screen.workarea
			local cgap = client.focus.border_width
			local sgap = thm.useless_gap
			local ugeo = {
				x = (cgeo.x + cgeo.width + cgap + _inc_by) > (sgeo.width - cgap) and (cgeo.x - _inc_by) or cgeo.x,
				y = cgeo.y,
				width = (cgeo.width + _inc_by),
				height = cgeo.height,
			}
			ugeo.x = ugeo.x < sgeo.x and sgeo.x or ugeo.x
			ugeo.width = (ugeo.width + (cgap * 2)) >= swrk.width and (swrk.width - (cgap * 2)) or ugeo.width
			ugeo.width = ugeo.width > _min_size and ugeo.width or _min_size
			client.focus:geometry(ugeo)
		else
			awful.tag.incmwfact(0.01)
		end
	end
end

_wm.decw = function(...)
	return function(...) --[[ h ]]
		if client.focus.floating or awful.layout.getname() == "floating" then
			local cgeo = client.focus:geometry()
			client.focus:geometry({
				x = cgeo.x < 0 and 0 or cgeo.x,
				y = cgeo.y,
				width = (cgeo.width - 30),
				height = cgeo.height,
			})
		else
			awful.tag.incmwfact(-0.01)
		end
	end
end

_wm.incncol = function()
	return function()
		awful.tag.incncol(1, nil, true)
	end
end --[[ h ]]
_wm.decncol = function()
	return function()
		awful.tag.incncol(-1, nil, true)
	end
end --[[ l ]]

-- ############################################################### --
return _wm
