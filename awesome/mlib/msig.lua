local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local thm = require("beautiful")
local mtasklist = require("mlib/mtasklist")
local mtags = require("mlib/mtags")
local quake = require("util/quake") -- TODO mv me to ./lib too
local colors = require("mlib/colors")
-- term_mst = "kitty --single-instance --listen-on=unix:/tmp/kitty-master"

-- xc
local xc = xc

local msig = {}

local function set_wallpaper(s)
	local wallpaper = thm.wallpaper
	if type(wallpaper) == "function" then
		wallpaper = wallpaper(s)
	end -- If wallpaper is a function, call it with the screen
	gears.wallpaper.maximized(wallpaper, s, true)
end
function Right_tri(cr, width, height, degree)
	cr:move_to(18, 0)
	cr:line_to(0, 18)
	cr:line_to(18, 18)
	cr:close_path()
end
local function mysep(color, shape)
	return wibox.widget({
		shape = shape,
		color = color,
		border_width = 0,
		forced_width = 18,
		widget = wibox.widget.separator,
	})
end
-- wibox.container.background(mysep('#fff000', Right_tri), '#00ff00')

local lain = require("lain")
local markup = lain.util.markup
local function get_color(value, defColor, reverse)
	local color = xc.wbg or "#fff000"

	value = tonumber(value) or 1

	-- if not value or type(value) ~= 'number' then return xc.color1 end
	-- if reverse == 2 then if value > 90 then return xc.wbx else return defColor end end
	-- if reverse == true then value = 100 - value end
	-- if value < 1 then value      = value * 100 end

	if value < 20 then
		color = xc.ebg
	elseif value < 60 then
		color = xc.wbg
	else
		color = xc.sbg
	end

	return color
end

-- ----------------------------------------------------------------
local mg_lr, mg_tb = 4, 2
local shape_fh = 8
local shape_sp = 0
-- ----------------------------------------------------------------
-- Battery
local bat = wibox.widget({
	{
		max_value = 100,
		forced_height = thm.progressbar_width,
		margins = { top = mg_lr, bottom = mg_lr, left = mg_tb, right = mg_tb },
		widget = wibox.widget.progressbar,
		shape = gears.shape.rounded_rect,
	},
	direction = "east",
	widget = wibox.container.rotate,
})
awful.tooltip({
	objects = { bat },
	timer_function = function()
		return markup.fontfg(thm.font, colors.bat, " bat")
			.. markup.fontfg(thm.font, get_color(bat_now.perc, colors.bat), bat_now.perc .. "%")
	end,
})
lain.widget.bat({
	full_notify = false,
	settings = function()
		local perc = bat_now.perc ~= "N/A" and bat_now.perc .. "%" or bat_now.perc
		if bat_now.ac_status == 1 then
			perc = perc .. " plug"
		end
		bat.widget:set_value(tonumber(bat_now.perc))
		-- bat.widget:set_color(get_color(bat_now.perc, colors.bat))
		bat.widget:set_color(xc.ebg)
	end,
})
local batx = {
	bat,
	{
		{
			{ text = "", widget = wibox.widget.textbox },
			forced_height = shape_fh,
			bg = colors.bat,
			-- shape = gears.shape.rounded_rect,
			widget = wibox.container.background,
			fill_space = true,
		},
		left = mg_lr,
		right = mg_lr,
		top = mg_tb,
		bottom = mg_tb,
		widget = wibox.container.margin,
	},
	forced_num_cols = 1,
	forced_num_rows = 2,
	homogeneous = false,
	expand = true,
	spacing = shape_sp,
	layout = wibox.layout.grid,
}
-- ----------------------------------------------------------------
-- Coretemp
local temp = wibox.widget({
	{
		max_value = 100,
		shape = gears.shape.radial_rounded_rect,
		bar_shape = gears.shape.rounded_rect,
		forced_height = thm.progressbar_width,
		margins = { top = mg_lr, bottom = mg_lr, left = mg_tb, right = mg_tb },
		widget = wibox.widget.progressbar,
	},
	direction = "east",
	widget = wibox.container.rotate,
})
local tempx = wibox.widget({
	{
		{ text = "", widget = wibox.widget.textbox },
		forced_height = shape_fh,
		bg = colors.temp,
		widget = wibox.container.background,
		fill_space = true,
	},
	left = mg_lr,
	right = mg_lr,
	top = mg_tb,
	bottom = mg_tb,
	widget = wibox.container.margin,
})
local tempz = {
	temp,
	tempx,
	forced_num_cols = 1,
	forced_num_rows = 2,
	homogeneous = false,
	expand = true,
	spacing = shape_sp,
	layout = wibox.layout.grid,
}
local spawnWidget = wibox.widget({})
awful.tooltip({
	objects = { temp },
	timer_function = function()
		return markup.fontfg(thm.font, colors.temp, " temp")
			.. markup.fontfg(thm.font, get_color(coretemp_now, colors.temp, true), " " .. coretemp_now .. "°C")
	end,
})
lain.widget.temp({
	settings = function()
		temp.widget:set_value(tonumber(coretemp_now))
		temp.widget:set_color(get_color(coretemp_now, colors.temp, true))
	end,
})
-- ----------------------------------------------------------------
-- Weather
-- thm.weather = lain.widget.weather({
--     city_id = "1733046",
--     notification_preset = { font = "roboto medium 8", fg = thm.fg_normal },
--     weather_na_markup = markup.fontfg(thm.font, "#eca4c4", "N/A "),
--     settings = function()
--         descr = weather_now["weather"][1]["description"]:lower()
--         units = math.floor(weather_now["main"]["temp"])
--         widget:set_markup(markup.fontfg(thm.font, colors.weather, "") .. markup.fontfg(thm.font, get_color(units, colors.blue_dark, true), " " .. descr .. " " .. units .. "°C  "))
--     end
-- })
-- ----------------------------------------------------------------
-- ----------------------------------------------------------------
-- / fs
-- local fs = wibox.widget {
--     {
--         max_value = 100,
--         forced_height = thm.progressbar_width,
--         margins = { top = mg_lr, bottom = mg_lr, left = mg_tb, right = mg_tb },
--         widget = wibox.widget.progressbar,
--     },
--     direction = 'east',
--     widget = wibox.container.rotate,
-- }
-- awful.tooltip({
--     objects = { fs },
--     timer_function = function()
--                 return markup.fontfg(thm.font, colors.temp, "") .. markup.fontfg(thm.font, get_color(coretemp_now, colors.temp, true), " " .. coretemp_now .. "°C")
--                 -- return markup.fontfg(thm.font, colors.fs, "") ..  markup.fontfg(thm.font, get_color(fs_now.used, colors.fs, true), " " ..  fs_now.available_gb .. "gb " ..  fs_now.used .. "%")
--         end
-- })
-- lain.widget.fs({
--     options = "--exclude-type=tmpfs",
--     partition = "/",
--     settings = function()
--         fs.widget:set_value(tonumber(fs_now.used))
-- --        fs.widget:set_color(get_color(fs_now.used, colors.fs, 2))
--     end
-- })
-- ----------------------------------------------------------------
-- CPU
local cpu = wibox.widget({
	{
		max_value = 100,
		forced_height = thm.progressbar_width,
		margins = { top = mg_lr, bottom = mg_lr, left = mg_tb, right = mg_tb },
		widget = wibox.widget.progressbar,
		shape = gears.shape.radial_rounded_rect,
		bar_shape = gears.shape.rounded_rect,
	},
	direction = "east",
	widget = wibox.container.rotate,
})

awful.tooltip({
	objects = { cpu },
	timer_function = function()
		return markup.fontfg(thm.font, colors.cpu, "cpu")
			.. markup.fontfg(thm.font, get_color(cpu_now.usage, colors.cpu, true), " " .. cpu_now.usage .. "%")
	end,
})
lain.widget.cpu({
	settings = function()
		cpu.widget:set_value(tonumber(cpu_now.usage))
		cpu.widget:set_color(get_color(cpu_now.usage, colors.cpu, true))
	end,
})
local cpux = {
	cpu,
	{
		{
			{ text = "", widget = wibox.widget.textbox },
			forced_height = shape_fh,
			bg = colors.cpu,
			-- shape = gears.shape.rectangle,
			-- bar_shape = gears.shape.rectangle,
			widget = wibox.container.background,
			fill_space = true,
		},
		left = mg_lr,
		right = mg_lr,
		top = mg_tb,
		bottom = mg_tb,
		widget = wibox.container.margin,
	},
	forced_num_cols = 1,
	forced_num_rows = 2,
	homogeneous = false,
	expand = true,
	spacing = shape_sp,
	layout = wibox.layout.grid,
}
-- ----------------------------------------------------------------
-- MEM
local mem = wibox.widget({
	{
		max_value = 100,
		forced_height = thm.progressbar_width,
		margins = { top = mg_lr, bottom = mg_lr, left = mg_tb, right = mg_tb },
		widget = wibox.widget.progressbar,
		shape = gears.shape.radial_rounded_rect,
		bar_shape = gears.shape.rounded_rect,
	},
	direction = "east",
	widget = wibox.container.rotate,
})
awful.tooltip({
	objects = { mem },
	timer_function = function()
		return markup.fontfg(thm.font, colors.mem, " mem")
			.. markup.fontfg(thm.font, get_color(mem_now.perc, colors.mem, true), " " .. mem_now.perc .. "%")
	end,
})
lain.widget.mem({
	settings = function()
		mem.widget:set_value(tonumber(mem_now.perc))
		mem.widget:set_color(get_color(mem_now.perc, colors.mem, true))
	end,
})
local memx = {
	{
		{
			{ text = "", widget = wibox.widget.textbox },
			forced_height = shape_fh,
			bg = colors.mem,
			-- shape = gears.shape.rounded_rect,
			-- shape = gears.shape.radial_rounded_rect,
			widget = wibox.container.background,
			fill_space = true,
		},
		left = mg_lr,
		right = mg_lr,
		top = mg_tb,
		bottom = mg_tb,
		widget = wibox.container.margin,
	},
	forced_num_cols = 1,
	forced_num_rows = 2,
	homogeneous = false,
	expand = true,
	spacing = shape_sp,
	layout = wibox.layout.grid,
}
-- ----------------------------------------------------------------
-- ----------------------------------------------------------------
-- ALSA
local alsabar = wibox.widget({
	{
		max_value = 100,
		forced_height = thm.progressbar_width,
		margins = { top = mg_lr, bottom = mg_lr, left = mg_tb, right = mg_tb },
		widget = wibox.widget.progressbar,
		shape = gears.shape.rounded_rect,
		bar_shape = gears.shape.rounded_rect,
	},
	direction = "east",
	widget = wibox.container.rotate,
})
awful.tooltip({
	objects = { alsabar },
	timer_function = function()
		return markup.fontfg(thm.font, colors.alsabar, "vol")
			.. markup.fontfg(thm.font, get_color(volume_now.level, colors.alsabar, 2), " " .. volume_now.level .. "%")
	end,
})
thm.volume = lain.widget.alsa({
	settings = function()
		if volume_now.status == "off" then
			--            volume_now.level = volume_now.level .. "M"
			volume_now.level = 0
		end
		alsabar.widget:set_value(tonumber(volume_now.level))
		alsabar.widget:set_color(
			xc.ebg
			-- get_color(volume_now.level, colors.alsabar, 2)
			--        "#008787"
			--        colors.blue_dark
		)
	end,
})
local alsabarx = {
	alsabar,
	{
		{
			{ text = "", widget = wibox.widget.textbox },
			forced_height = shape_fh,
			bg = colors.alsabar,
			-- shape = gears.shape.rounded_rect,
			widget = wibox.container.background,
			fill_space = true,
		},
		left = mg_lr,
		right = mg_lr,
		top = mg_tb,
		bottom = mg_tb,
		widget = wibox.container.margin,
	},
	forced_num_cols = 1,
	forced_num_rows = 2,
	homogeneous = false,
	expand = true,
	spacing = shape_sp,
	layout = wibox.layout.grid,
}
-- ----------------------------------------------------------------
-- Net
local netdown = wibox.widget({
	{
		max_value = 10,
		forced_height = thm.progressbar_width,
		margins = { top = mg_lr, bottom = mg_lr, left = mg_tb, right = mg_tb },
		widget = wibox.widget.progressbar,
		shape = gears.shape.radial_rounded_rect,
		bar_shape = gears.shape.rounded_rect,
		-- bar_shape = gears.shape.rounded_rect,
	},
	direction = "east",
	widget = wibox.container.rotate,
})
local netdownx = {
	netdown,
	{
		{
			{ text = "", widget = wibox.widget.textbox },
			forced_height = shape_fh,
			bg = colors.net,
			-- shape = gears.shape.rounded_rect,
			widget = wibox.container.background,
			fill_space = true,
		},
		left = mg_lr,
		right = mg_lr,
		top = mg_tb,
		bottom = mg_tb,
		widget = wibox.container.margin,
	},
	forced_num_cols = 1,
	forced_num_rows = 2,
	homogeneous = false,
	expand = true,
	spacing = shape_sp,
	layout = wibox.layout.grid,
}
local netup = wibox.widget({
	{
		max_value = 10,
		forced_height = thm.progressbar_width,
		margins = { top = mg_lr, bottom = mg_lr, left = mg_tb, right = mg_tb },
		widget = wibox.widget.progressbar,
		shape = gears.shape.radial_rounded_rect,
		bar_shape = gears.shape.rounded_rect,
	},
	direction = "east",
	widget = wibox.container.rotate,
})
awful.tooltip({
	objects = { netdown },
	timer_function = function()
		return markup.fontfg(thm.font, colors.net, " netdown")
			.. markup.fontfg(thm.font, get_color(net_now.received, colors.net, true), " " .. net_now.received .. "kb")
	end,
})
awful.tooltip({
	objects = { netup },
	timer_function = function()
		return markup.fontfg(thm.font, colors.net, " netup")
			.. markup.fontfg(thm.font, get_color(net_now.sent, colors.net, true), " " .. net_now.sent .. "kb")
	end,
})
local netupx = {
	netup,
	{
		{
			{ text = "", widget = wibox.widget.textbox },
			forced_height = shape_fh,
			bg = colors.net,
			-- shape = gears.shape.rounded_rect,
			widget = wibox.container.background,
			fill_space = true,
		},
		left = mg_lr,
		right = mg_lr,
		top = mg_tb,
		bottom = mg_tb,
		widget = wibox.container.margin,
	},
	forced_num_cols = 1,
	forced_num_rows = 2,
	homogeneous = false,
	expand = true,
	spacing = shape_sp,
	layout = wibox.layout.grid,
}
lain.widget.net({
	settings = function()
		-- if iface ~= "network off" and
		--         string.match(thm.weather.widget.text, "N/A")
		-- then
		--     thm.weather.update()
		-- end
		netdown.widget:set_value(tonumber(net_now.received))
		netdown.widget:set_color(get_color(net_now.received, colors.net, true))
		netup.widget:set_value(tonumber(net_now.sent))
		netup.widget:set_color(get_color(net_now.sent, colors.net, true))
	end,
})
-- ----------------------------------------------------------------
-- SYSLOAD
local sysload = wibox.widget({
	{
		max_value = 10,
		forced_height = thm.progressbar_width,
		margins = { top = mg_lr, bottom = mg_lr, left = mg_tb, right = mg_tb },
		widget = wibox.widget.progressbar,
		shape = gears.shape.radial_rounded_rect,
		bar_shape = gears.shape.rounded_rect,
	},
	direction = "east",
	widget = wibox.container.rotate,
})
awful.tooltip({
	objects = { sysload },
	timer_function = function()
		return markup.fontfg(thm.font, colors.sysload, "sysload")
			.. markup.fontfg(thm.font, get_color(load_1 * 10, colors.sysload, true), " " .. load_1)
	end,
})
lain.widget.sysload({
	settings = function()
		sysload.widget:set_value(tonumber(load_1))
		sysload.widget:set_color(get_color(load_1 * 10, colors.sysload, true))
	end,
})
local sysloadx = {
	sysload,
	{
		{
			{ text = "", widget = wibox.widget.textbox },
			forced_height = shape_fh,
			bg = colors.sysload,
			-- shape = gears.shape.rounded_rect,
			-- shape = new_shape,
			widget = wibox.container.background,
			fill_space = true,
		},
		left = mg_lr,
		right = mg_lr,
		top = mg_tb,
		bottom = mg_tb,
		widget = wibox.container.margin,
	},
	forced_num_cols = 1,
	forced_num_rows = 2,
	homogeneous = false,
	expand = true,
	spacing = shape_sp,
	layout = wibox.layout.grid,
}
--[[-- ----------------------------------------------------------------]]
-- ////////////////////////////////////////////////////////////////
-- ----------------------------------------------------------------
--[[
local memory = lain.widget.mem({
        settings = function()
                widget:set_markup(
                        markup.fontfg(thm.font, thm.sbg, "") ..
                        markup.fontfg(
                                thm.font, get_color(mem_now.perc, true), " " ..
                                mem_now.perc .. "%  "
                        )
                )
        end
})
]]

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
-- screen.connect_signal("property::geometry", set_wallpaper)
msig.sconnect = function(...)
	local s = ...

	-- (function(s) Wallpaper
	set_wallpaper(s)
	-- gears.wallpaper.maximized(wallpaper, s, true)

	-- Each screen has its own tag table.
	mtags.on_screen_connect(s)

	-- s.master_tmux = quake({ app = terminal
	s.master_tmux = quake({
		app = "alacritty", -- s.master_tmux = quake({ app = 'kitty' -- , name = "MTX_MASTER"
		argname = "--class %s", -- , extra = 'mtx master' -- , extra = ' -e mtx master' -- , argname = '--name=%s'
		extra = '--option window.dimensions.lines=18 window.dimensions.columns=183 "window.position={x: 0, y: 60}" -e mtx master', -- 213
		followtag = true, --single-instance
	})
	--option window.position.x=0 window.position.y=30 window.dimensions.columns=175 window.dimensions.lines=23 -e
	-- s.slave_tmux = quake({ app = term_alacritty
	--     , name = "MTX_MASTER"
	--     , argname = '--class %s'
	--     , extra = ' -e mtx master'
	--     -- , extra = '--option window.dimensions.lines=15 "window.position={x: 0, y: 30}" -e mtx master'
	--     , screen = s
	--     , followtag = true
	--   })

	s.spawnPromptWidget = awful.widget.prompt()
	s.mylayoutbox = awful.widget.layoutbox(s)
	s.mylayoutbox:buttons(gears.table.join(
		awful.button({}, 1, function()
			awful.layout.inc(1)
		end),
		awful.button({}, 3, function()
			awful.layout.inc(-1)
		end),
		awful.button({}, 4, function()
			awful.layout.inc(1)
		end),
		awful.button({}, 5, function()
			awful.layout.inc(-1)
		end)
	))
	local _shape_hard = function(cr, w, h)
		gears.shape.rounded_rect(cr, w, h, 40)
	end
	mtagswidget = awful.widget.taglist({
		screen = s,
		-- style = {
		-- 	shape = gears.shape.circle,
		-- },

		-- forced_height = 200,
		style = {
			shape = gears.shape.rounded_bar,
			spacing = 0,
		},
		layout = wibox.layout.fixed.horizontal,

		filter = awful.widget.taglist.filter.all,
		buttons = mtags.taglist_buttons,
	})

	-- mtagswidget.style = { shape = tshape }
	-- s.mytaglist = mtagswidget
	s.mywibox = awful.wibar({
		-- bgimage = img,
		-- type = "desktop", -- desktop, normal, dock,
		-- y = 200,
		-- x = 300,
		stretch = false,
		-- position = "top",
		-- position = "bottom",
		screen = s,
		-- opacity = 1,
		opacity = 0.7,
		--height = 42
		width = s.workarea.width - 120,
		height = 60,
		-- opacity = 0.7,
		-- x = 10,
		-- shape = gears.shape.rounded_rect, -- rounded_bar
		shape = _shape_hard,

		-- shape = round_shape,
		-- shape = gears.shape.rounded_rect,
		-- shape_clip = gears.shape.rounded_rect,
		border_width = 20,
		-- border_color = thm.border_focus,
		-- type = "normal",
		optop = true,
	}) -- ,  height = 42

	local xspacing_widget = {
		-- color = "#000000",
		color = thm.border_normal,
		opacity = 0.5,
		forced_width = 10,
		shape = gears.shape.rounded_rect,
		widget = wibox.widget.separator,
	}
	local mysepx = {
		{
			{ forced_width = 10, shape = gears.shape.rounded_rect, widget = wibox.widget.separator },
			fg = thm.red_l,
			widget = wibox.container.background,
			opacity = 0.0,
		},
		spacing = 10,
		layout = wibox.layout.fixed.horizontal,
	}

	local mysep = {
		{
			{ forced_width = 8, shape = gears.shape.rounded_rect, widget = wibox.widget.separator },
			fg = thm.xshade_1,
			widget = wibox.container.background,
		},
		layout = wibox.layout.fixed.horizontal,
	}

	local mysepz = {
		{
			{
				forced_width = 8,
				shape = gears.shape.rounded_rect,
				widget = wibox.widget.separator,
			},
			fg = thm.xshade_0,
			opacity = 0.2,
			widget = wibox.container.background,
		},
		layout = wibox.layout.fixed.horizontal,
	}

	-- s.mytasklist = mtasklist.primary_tasklist(s)
	local mysystray = wibox.widget.systray()
	-- mysystray.forced_height = 90
	mysystray.opacity = 0.2
	mysystray.visible = true
	mysystray.forced_height = 98
	mysystray:set_base_size(48)

	local systrayx = {
		mysystray,
		-- margins = 12,
		top = 12,
		widget = wibox.container.margin,
	}

	-- local round_shape = function(cr, width, height)
	-- 	gears.shape.circle(cr, width, height, 40)
	-- end

	local spawnWidget = wibox.widget({
		layout = wibox.layout.fixed.horizontal,
		mysepx,
		mtagswidget,
		s.spawnPromptWidget,
	})
	--[[
	local bg = wibox.container.background()
	bg.bg = "#ff0000"
	local tb1 = wibox.widget.textbox("foo")
	local tb2 = wibox.widget.textbox("bar")
	tb1.text = "foo"
	tb2.text = "bar"
	local l = wibox.layout.fixed.vertical()
	l:add(tb1)
	l:add(tb2)
	bg.widget = l
]]
	--[[
	local bg = wibox.widget({
		{
			{
				text = "foo",
				widget = wibox.widget.textbox,
			},
			{
				text = "bar",
				widget = wibox.widget.textbox,
			},
			layout = wibox.layout.fixed.vertical,
		},
		bg = "#ff0000",
		widget = wibox.container.background,
	})
]]
	s.mywibox:setup({
		layout = wibox.layout.align.horizontal,
		spawnWidget,
		mtasklist.primary_tasklist(s),
		{
			layout = wibox.layout.fixed.horizontal,
			mysepz,
			tempz,
			sysloadx,
			netdownx,
			netupx,
			cpux,
			memx,
			alsabarx,
			batx,
			systrayx,
			mysepz,
			mytextclock,
			s.mylayoutbox,
		},
	})
end

msig.mmanage_border = function(c)
	mpoptasklist.visible = false
	if not c or awesome.startup or not awful.screen.focused().selected_tag then
		return
	end

	if client.focus then
		c.border_color = thm.border_focus
		return
	end

	if c.ontop then
		c.border_color = thm.border_ontop
	elseif c.urgent then
		c.border_color = thm.border_urgent
	else
		-- TODO:
		-- awful.taglist.filter.all = function(c)
		-- gears.debug.print_warning(screen)
		-- end
		gears.debug.print_warning("##  [[ SET BORDER ELSE ]]  ##")
		-- gears.debug.print_warning(awful.taglist.filter.all)
		c.border_color = thm.border_normal
	end
end

return msig
-- mdbg_t(self,'WTF') mdbg_t({geo={x=c.x,y=c.y,w=c.width,h=c.height,hints_honor=c.size_hints_honor, icon=c.icon,icon_name=c.icon_name}},      "manage_b_C") mdbg_t(capi,   "manage_b_CAPI") mdbg_t({geo={x=client.x,y=client.y,w=client.width,h=client.height,hints_honor=client.size_hints_honor}}, "manage_b_CLIENT")
-- local _ = {
--   normal = thm.border_normal,
--   focus = thm.border_focus,
--   marked = thm.red_d,
--   width = thm.border_width
-- }
-- local u = {}
-- f not awesome.startup then awful.client.setslave(c) en
-- f awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then mdbg_t({role=c.role,optop= c.optop, instance=c.instance,name=c.name,class=c.class,CCFocus=client.focus,  cfocus= c.focus, hint=c.size_hints_honor},'mxsignl', true)
--
-- if c.maximized or c.fullscreen or awful.rules.match_any(c, { instance = { "MTX_MASTER", "MTX_SLAVE" }}) then
--   c.border_width = 0
-- end

-- local normal_matches = awful.rules.match_any(c, { instance = { "spotify" }})
-- local t = awful.screen.focused().selected_tag
-- i f not t then mdbg_t({cn=c.name,cc=c.class}, "I_F_N_O_T_T") en d
--
-- msig.mmanage_border_top = function(c)
--   if not c or  awesome.startup then return end
--   if c.ontop then
--     c.border_color = thm.border_ontop
--   else
--     c.border_color = thm.border_normal
--   end
-- end
-- if awful.rules.match_any(c, { instance = { "aMFZ", "spotify", "Steam" }})
-- if client.focus
--   and not awful.rules.match_any(c, { instance = { "aMFZ", "spotify", "Steam" }})
--   and #t:clients() > 1 then
--   c.border_color = _.focus
-- else c.border_color = _.normal end
