local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local thm = require("beautiful")

local get_screen = function(s)
	return s and screen[s]
end
local m_filter_mtx = function(c, screen)
	return awful.rules.match_any(c, { instance = { "MTX_MASTER", "MTX_SLAVE", "MTX_UNO" } })
end
local m_filter_mfz = function(c, screen)
	return awful.rules.match_any(c, { instance = { "MFZ" } })
end
local m_filter_etc = function(c, screen)
	return (not m_filter_mtx(c) and not m_filter_mfz(c))
end

function meta_filter_cur_tags(c, screen)
	screen = get_screen(screen) -- Only print client on the same screen as this widget
	if get_screen(c.screen) ~= screen then
		return false
	end -- Include sticky client too
	if c.sticky then
		return true
	end
	-- if get_screen(c.screen) == get_screen(screen) -- same screen
	--   and client.focus ~= c  -- not focused
	--   and awful.rules.match_any(c, { instance = {"MTX_MASTER", "MTX_SLAVE", "MTX_UNO"}}) then  -- mtx
	--   return false
	-- end
	local tags = screen.tags
	for _, t in ipairs(tags) do
		if t.selected then
			local ctags = c:tags()
			for _, v in ipairs(ctags) do
				if v == t then
					return true
				end
			end
		end
	end
	return false
end
local tasklist_buttons = gears.table.join(
	awful.button({}, 1, function(c)
		if c == client.focus then
			c.minimized = true
		else
			c:emit_signal("request::activate", "tasklist", { raise = true })
		end
	end),
	awful.button({}, 3, function()
		awful.menu.client_list({ theme = { width = 250 } }, nil, m_filter_etc)
	end),
	-- awful.button({ }, 2, function() awful.menu.client_list({ theme = { width = 250,  } }, {icon = ''}, m_filter_mfz) end),
	awful.button({}, 4, function()
		awful.client.focus.byidx(1)
	end),
	awful.button({}, 5, function()
		awful.client.focus.byidx(-1)
	end)
)

local bg_tasklist = function(s)
	return awful.widget.tasklist({
		screen = s,
		filter = awful.widget.tasklist.filter.currenttags,
		buttons = tasklist_buttons,
		opacity = 1.0,
		shape = gears.shape.rounded_rect,
		style = {
			font = thm.font_large,
			shape_border_width = 0,
			-- shape_border_color = thm.xmain_1,
			-- bg_activity           = '#D84315',
			fg_activity = "#D84315",

			fg_focus = thm.prpl_l,
			bg_focus = thm.prpl_l,

			bg_urgent = thm.bg_urgent,
			fg_urgent = "#ffffff",

			bg_normal = thm.fg_focus,
			fg_normal = thm.fg_focus,

			bg_minimize = thm.taglist_fg_empty,
			fg_minimize = thm.bg_minimize,
		},
		layout = {
			spacing = 10,
			spacing_widget = {
				{
					forced_width = 5,
					widget = wibox.widget.separator,
				},
				valign = "center",
				halign = "center",
				widget = wibox.container.place,
			},
			layout = wibox.layout.flex.horizontal,
		},
		-- Notice that there is *NO* `wibox.wibox` prefix, it is a template,
		-- not a widget instance.
		widget_template = {
			{
				{
					{
						{
							id = "icon_role",
							widget = wibox.widget.imagebox,
						},
						margins = 2,
						widget = wibox.container.margin,
					},
					{
						id = "text_role",
						widget = wibox.widget.textbox,
					},
					layout = wibox.layout.fixed.horizontal,
				},
				left = 10,
				right = 10,
				widget = wibox.container.margin,
			},
			id = "background_role",
			widget = wibox.container.background,
		},
	})
end

local primary_tasklist = function(s)
	return awful.widget.tasklist({
		screen = s,
		filter = meta_filter_cur_tags,
		buttons = tasklist_buttons,
		style = {
			mtype = "PRIM",
		},
		-- shape = gears.shape.circle,
		-- layout = {
		-- 	spacing = 20,
		-- 	spacing_widget = {
		-- 		{
		-- 			forced_width = 0,
		-- 			color = thm.xshade_2,
		-- 			widget = wibox.widget.separator,
		-- 		},
		-- 		valign = "center",
		-- 		halign = "center",
		-- 		content_fill = true,
		-- 		fill = true,
		-- 		widget = wibox.container.place,
		-- 	},
		-- 	layout = wibox.layout.flex.horizontal,
		-- },
		-- widget_template = {
		--     {
		--         {
		--             {
		--                 { id     = 'icon_role', widget = wibox.widget.imagebox, },
		--                 margins = 2,
		--                 widget  = wibox.container.margin,
		--             },
		--             {
		--                 id     = 'text_role',
		--                 widget = wibox.widget.textbox,
		--             },
		--             layout = wibox.layout.fixed.horizontal,
		--         },
		--         left  = 10,
		--         right = 10,
		--         widget = wibox.container.margin
		--     },
		--     id     = 'background_role',
		--     widget = wibox.container.background,
		-- },

		-- widget_template = {
		--   {
		--     {
		--       { id     = 'text_role', widget = wibox.widget.textbox,
		--          wrap =	'word', valign= 'center', align = 'center',
		--          forced_width = 32
		--       },
		--       layout = wibox.layout.fixed.horizontal,
		--     },
		--     left  = 4, right  = 4, top = 0, bottom = 0, widget = wibox.container.margin
		--     --
		--   }, id= 'background_role', widget = wibox.container.background
		-- },
	})
end
--

return { primary_tasklist = primary_tasklist, bg_tasklist = bg_tasklist }
-- return { primary_tasklist = primary_tasklist }
--
-- ###############################################################
--
--     s.mytasklist = awful.widget.tasklist {
--         screen   = s,
--         filter   = awful.widget.tasklist.filter.currenttags,
--         buttons  = tasklist_buttons,
--         style    = {
--             shape_border_width = 1,
--             shape_border_color = '#777777',
--             shape  = gears.shape.rounded_bar,
--         },
--         layout   = {
--             spacing = 10,
--             spacing_widget = {
--                 {
--                     forced_width = 5,
--                     shape        = gears.shape.circle,
--                     widget       = wibox.widget.separator
--                 },
--                 valign = 'center',
--                 halign = 'center',
--                 widget = wibox.container.place,
--             },
--             layout  = wibox.layout.flex.horizontal
--         },
--         -- Notice that there is *NO* `wibox.wibox` prefix, it is a template,
--         -- not a widget instance.
--         widget_template = {
--             {
--                 {
--                     {
--                         {
--                             id     = 'icon_role',
--                             widget = wibox.widget.imagebox,
--                         },
--                         margins = 2,
--                         widget  = wibox.container.margin,
--                     },
--                     {
--                         id     = 'text_role',
--                         widget = wibox.widget.textbox,
--                     },
--                     layout = wibox.layout.fixed.horizontal,
--                 },
--                 left  = 10,
--                 right = 10,
--                 widget = wibox.container.margin
--             },
--             id     = 'background_role',
--             widget = wibox.container.background,
--         },
--     }
--
