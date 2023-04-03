local awful = require("awful")
local gears = require("gears")
local thm = require("beautiful")
-- local clientkeys = require("clientkeys")
-- awful.rules.rules = {
-- local mtags = require('mlib/mtags')
--

-- local clientkeys = require('mlib/keys_client')
-- local args = { ... }
local clientkeys = require("mlib/keys_client")

-- awful.rules.rules = mrules
local _mr = {}

-- _mr.setrules = function(clientkeys)
_mr.setrules = function(...)
	-- local clientkeys = ...

	-- local d, e, f = some_function()
	local clientbuttons = gears.table.join(
		awful.button({}, 1, function(c)
			c:emit_signal("request::activate", "mouse_click", { raise = true })
		end),
		awful.button({ modkey }, 1, function(c)
			c:emit_signal("request::activate", "mouse_click", { raise = true })
			awful.mouse.client.move(c)
		end),
		awful.button({ modkey }, 3, function(c)
			c:emit_signal("request::activate", "mouse_click", { raise = true })
			awful.mouse.client.resize(c)
		end)
	)

	awful.rules.rules = {
		-- All clients will match this rule.
		{
			rule = {},
			properties = {
				border_width = thm.border_width,
				border_color = thm.border_normal,
				focus = awful.client.focus.filter,
				raise = true,
				keys = clientkeys,
				buttons = clientbuttons,
				screen = awful.screen.preferred,
				placement = awful.placement.no_overlap + awful.placement.no_offscreen,
				titlebars_enabled = false,
				-- ,size_hints_honor = true
				-- ,honor_workarea = true
				-- ,honor_padding = true
			},
		},
		-- { rule = { focus = true }, properties = { border_color = thm.green_d } },
		-- { rule = { maximized = true }, properties = { border_width = 0, size_hints_honor = false} },
		{ rule_any = { type = { "dock" } }, properties = { sticky = true, ontop = true, obove = true } },
		-- { rule_any = {type = { "normal", "dialog" } }, properties = { titlebars_enabled = false } },
		{
			rule_any = {
				instance = {
					"feh",
				},
				class = {
					"Arandr",
					"Blueman-manager",
					"Gpick",
					"Sxiv",
				},
				name = {
					"sxiv",
					"Event Tester", -- xev.
				},
				role = {
					"clientindow", -- Thunderbird's calendar.
					"clientManager", -- Thunderbird's about:config.
					"pop-up", -- e.g. Google Chrome's (detached) Developer Tools.
				},
			},
			properties = { floating = true },
		},
		{
			rule = { class = "www.youtube.com" }, -- name = "metaory.github.io",
			properties = {
				floating = true,
				border_width = 20,
				size_hints_honor = true,
				placement = awful.placement.no_overlap, -- + awful.placement.no_offscreen
			},
		},

		{
			rule = { class = "Chromium", role = "pop-up" }, -- name = "metaory.github.io",
			properties = {
				floating = false,
				size_hints_honor = true,
				-- placement = awful.placement.center_horizontal + awful.placement.centered
				placement = awful.placement.no_offscreen,
			},
		},
		{
			rule_any = { instance = { "MFZ" } },
			properties = {
				floating = true,
				-- placement = awful.placement.top + awful.placement.center_horizontal,
				placement = awful.placement.top + awful.placement.center,
				skip_taskbar = true,
				-- placement = awful.placement.maximize_horizontally,
				-- placement = awful.placement.top ,
				-- maximize_horizontally = true
				y = 120,
				opacity = 0.8,
				border_width = thm.border_width,
				border_color = thm.border_normal,
				-- maximized = true
			},
		},
		{
			rule_any = {
				instance = { "kitty", "Alacritty", "termite", "MTX_UNO" },
				class = { "kitty" },
			},
			-- except_any = { name = { "WTF" }, class = { "zzz" }, instance = { "____MTX" }  },
			-- except_any = { name = { "ranger", "QUAKE" } },
			except_any = { name = { "ranger", "QUAKE" }, instance = { "MTX_MASTER", "MTX_SLAVE" } },
			properties = {
				border_width = thm.border_width,
				border_color = thm.border_normal,
				size_hints_honor = true,
				-- honor_workarea = true,
				-- honor_padding = true,
				-- margins = 50,
				-- margins = {left = 4, right = 4, top = 4, bottom = 100},
				offset = 200,
				-- pretend = false,
				-- attach = true,
				-- update_workarea = true,
				-- awful.placement.no_offscreen
				-- placement = awful.placement.stretch_left
				-- placement = awful.placement.bottom_left + awful.placement.no_overlap + awful.placement.no_offscreen
				-- placement = {honor_workarea=true, to_percent = 0.5,
				-- awful.placement.bottom_left , awful.placement.no_overlap }

				-- placement = {honor_workarea=true, margins=90}
				--     placement = awful.placement.closest_corner(
				-- {coords=function() return {x = 100, y=100} end},
				-- {include_sides = true, bounding_rect = {x=0, y=0, width=200, height=200}} )

				placement = awful.placement.no_overlap + awful.placement.no_offscreen,
				-- placement = awful.placement.bottom_right --awful.placement.no_overlap+awful.placement.no_offscreen
			},
		},
		{
			rule_any = { instance = { "MTX_MASTER", "MTX_SLAVE" } },
			properties = {
				border_width = 0,
				-- size_hints_honor = true,
				-- honor_workarea = true,
				-- honor_padding = true,
				--
				-- placement = awful.placement.top + awful.placement.center_horizontal
				-- floating = true,
				-- honor_workarea = true,
				-- size_hints_honor = true,
				placement = awful.placement.top + awful.placement.maximize_horizontally,
				-- placement = awful.placement.maximize_horizontally,
				-- placement = awful.placement.top ,
				-- maximize_horizontally = true
				-- border_color=border_marked,
				-- maximized = true
			},
		},
		{
			rule = { class = "mpv" },
			properties = {
				border_width = 0,
				-- placement = awful.placement.center_horizontal + awful.placement.centered,
				placement = awful.placement.no_offscreen,
				size_hints_honor = true,
			},
		},
		{
			rule_any = { name = { "XSession", "Journal" } },
			properties = {
				border_width = 0,
				tag = awful.screen.focused().tags[8],
			},
		},
		{
			rule_any = {
				role = {},
				name = { "ranger", "nnn" },
			},
			properties = {
				-- tag = mtags.tags[4],
				-- tag = root.tags()[4],
				-- border_width=20,
				floating = true,
				placement = awful.placement.center_horizontal + awful.placement.centered,
			},
		},
		{
			rule_any = { name = { "rtorrent" } },
			properties = { tag = awful.screen.focused().tags[3] },
		},
		{
			rule_any = { instance = { "Spotify", "dota2" }, class = { "Spotify" } },
			properties = { tag = awful.screen.focused().tags[5], placement = awful.placement.centered },
		},
		-- FULL-SCREEN --
		{
			rule_any = { instance = { "dota2" } },
			properties = { fullscreen = true, floating = false },
		},
		-- ### --
		-- CENTERED --
		{
			rule_any = { instance = { "github.com" } },
			properties = {
				floating = false,
				x = awful.screen.focused().workarea.width * 0.1,
				y = awful.screen.focused().workarea.height * 0.08,
				width = awful.screen.focused().workarea.width * 0.8,
				height = awful.screen.focused().workarea.height * 0.9,
			},
		},
		-- ### --
		{
			rule_any = { instance = { "Steam" } },
			properties = { tag = awful.screen.focused().tags[6], placement = awful.placement.centered },
		},
		-- {
		--   rule_any = { instance = { "Steam", "spotify" }, class={"Spotify"} },
		--   properties = {  ,placement = awful.placement.centered }
		-- },
		{
			-- rule = { instance = "slack" },
			rule_any = { instance = { "slack", "telegram-desktop" } },
			properties = { tag = awful.screen.focused().tags[9], border_width = 0, maximized = false },
		},
	}
end

return _mr
-- return setmetatable(mtags, { __call = function(_, ...) return worker(...) end })
-- local a, b, c = ...
-- mdbg_t({x=1,a=a,b=b,c=c},'--#######__MR_MSR_____2______________')
