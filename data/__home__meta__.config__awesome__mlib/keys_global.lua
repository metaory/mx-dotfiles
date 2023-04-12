local awesome, client, mouse, screen, tag = awesome, client, mouse, screen, tag
local gears = require("gears")
local naughty = require("naughty")
local awful = require("awful")
local thm = require("beautiful")
local mmenus = require("mlib/menus")
local hotkeys_popup = require("awful.hotkeys_popup")
local mpopup = require("mlib/mpopup")
local xresources = require("beautiful.xresources")
local xc = xresources.get_current_theme()
-- local with_move = require('mlib/with_move')
local bling = require("bling")
-- local awestore = require("awestore")                  -- Totally optional, only required if you are using animations.
local _w = require("mlib/with_wrapper")
local _mv_margins = { left = 5, right = 5, top = 5, bottom = 5 }
local _mv_offset = { x = 5, y = 5 }
local _inc_by = 30
local _min_size = 200

local mdbg_p = function(label, value)
	gears.debug.print_warning(label .. ": " .. tostring(value))
end
local mdbg_t = function(data, tag, notif)
	gears.debug.print_warning(gears.debug.dump_return(data, " >> " .. string.upper(tag), 20))
end

-- XXX Mod4 + [ 0-= < p[]\ ]

local altkey = "Mod1"
local modkey = "Mod4"
local ctrlky = "Control"
local shiftk = "Shift"

local with_prop_upd = function(prop, upd, opt)
	return function()
		local c = client.focus
		if c then
			c[prop] = opt and upd + c[prop] or upd
			-- naughty.notify({ title = prop, text = tostring(upd), timeout = 5 })
		end
	end
end
local filter_etc = function(c, screen)
	return awful.rules.match_any(c, {
		rule_any = {},
		except_any = {
			instance = { "kitty", "Alacritty", "termite", "MTX_UNO" },
			class = { "kitty" },
		},
		-- properties = { floating = true }
	})
end

-- These are example awestore tween stores. You can use one for just y, just x, or both.
-- The duration and easing is up to you. Please check out the awestore docs to learn more.
--
-- local anim_y = awestore.tweened(1100, {
--     duration = 300,
--     easing = awestore.easing.cubic_in_out
-- })
-- local anim_x = awestore.tweened(1920, {
--     duration = 300,
--     easing = awestore.easing.cubic_in_out
-- })

local _p = gears.debug.print_warning
local pret_test = function()
	awful.spawn("chromium --app=https://github.com")
	awful.spawn(
		"chromium --app=https://nyaa.si/?f=0&c=1_2&q=erai+720 https://anilist.co/search/anime?year=2021&season=SPRING"
	)
	os.execute("sleep 5")
	local t = awful.screen.focused().selected_tag
	local tabobj = {}
	-- for _, c in ipairs(clients) do
	for idx, c in ipairs(t:clients()) do
		_p(">>>>")
		_p(c.class)
		if c.class == "chromium" then
			-- local list_clients = tabobj.clients
			tabobj.clients[#tabobj.clients + 1] = c
			tabobj.focused_idx = idx
			-- tabbed.update(tabobj)
			bling.module.tabbed.add(c, tabobj)
		end
	end
end

-- bling.module.tabbed.pick()
local globalkeys = gears.table.join(
	-- globalkeys = gears.table.join(

	awful.key({ modkey }, "slash", hotkeys_popup.show_help, { description = "show help", group = "awesome" }),

	awful.key({ modkey }, "backslash", function()
		awful.menu.client_list({ theme = { width = 450 } }, nil, filter_etc)
	end),

	awful.key({ modkey, shiftk }, "BackSpace", function()
		mpoptasklist.visible = not mpoptasklist.visible
	end, { description = "show help", group = "awesome" }),
	-- ,awful.key({ modkey }, "i",    root_leader)
	-- awful.key({ altkey }    , "Menu"        , function() awful.screen.focused().defl_tmux:toggle() end)       ,
	-- , awful.key({ modkey, ctrlky} , "Alt_L", with_wrapper.term('--name=MTX_MASTER -o "initial_window_height 12c" mtx -n master'))
	-- , awful.key({ altkey } , "Super_L" , root_leader)
	--
	-- awful.key({ "Alt_L"    } , "          pace" , root_leader)
	-- i y g v
	-- term_scratch:toggle()   -- toggles the scratchpads visibility
	-- term_scratch:turn_on()  -- turns the scratchpads visibility on
	-- term_scratch:turn_off() -- turns the scratchpads visibility off
	awful.key({ modkey }, "y", function()
		Web_scratch:toggle()
	end),
	awful.key({ modkey }, "v", function()
		term_scratch:toggle()
	end),
	-- ,awful.key({ modkey }, "c" , function (c) ddoc_scratch:toggle() end)
	awful.key({ modkey }, "c", function()
		awful.spawn("clipmenu")
	end),
	--  clipmenu -i -fn Hack:size=18 -nb xc.SK2 -nf xc.SK5 -sb xc.SK1 -sf xc.WBG
	-- ,awful.key({ modkey }, "i" , function () pret_test() end)
	-- ,awful.key({ modkey }, "y" , function (c) term_scratch:turn_off() end)
	-- i y a d g v b
	awful.key({ modkey }, "a", function()
		bling.module.tabbed.pick()
	end),
	awful.key({ modkey }, "d", function()
		bling.module.tabbed.pop()
	end),
	awful.key({ modkey }, "b", function()
		bling.module.tabbed.iter()
	end),
	awful.key({}, "KP_Begin", PrimaryLeader),
	awful.key({ altkey }, "space", PrimaryLeader),
	-- , awful.key({ modkey } , "Menu"  , SecondaryLeader)
	awful.key({ ctrlky }, "Menu", with_wrapper.mtx("slave_tmux", "toggle")),
	awful.key({ altkey }, "Menu", with_wrapper.mtx("master_tmux", "toggle")),
	awful.key({ modkey }, "r", with_wrapper.with_mfz("mfz-run"), { description = "mfz run", group = "launcher" }),
	awful.key({ modkey, shiftk }, "r", with_wrapper.prompt(), { description = "mfz web", group = "launcher" }),
	-- , awful.key({ modkey, shiftk }, "r", function () awful.screen.focused().spawnPromptWidget:run() end, {description = "run prompt", group = "launcher"})
	-- , awful.key({ modkey } , "Alt_L" , with_wrapper.mtx('master_tmux' , 'toggle'))
	awful.key({ altkey }, "Tab", with_wrapper.mtx("master_tmux", "toggle")),
	-- , awful.key({        } , "KP_Begin", with_wrapper.mtx('master_tmux', 'toggle'))
	-- , awful.key({ modkey, altkey } , "Menu",with_wrapper.mtx('slave_tmux', 'toggle'))
	-- , awful.key({ modkey,ctrlky, shiftk } , "Menu",with_wrapper.mtx('slave_tmux', 'toggle'))
	-- ,awful.key( { modkey,         shiftk } , "Return", with_wrapper.term("--name=MTX_UNO mtx"),                        { description = "attach to existing uno" , group = "launcher"      } )
	-- ,awful.key( { modkey, altkey, ctrlky } , "Return", with_wrapper.term("--class MTX_UNO -e mtx -n", term_alacritty), { description = "open nested tmx" , group = "launcher"             } )
	awful.key({ modkey, shiftk }, "/", function()
		awful.layout.set(awful.layout.suit.floating)
	end, { description = "reset to floating", group = "layout" }),
	awful.key(
		{ modkey, ctrlky },
		"space",
		awful.client.floating.toggle,
		{ description = "toggle floating", group = "client" }
	),
	awful.key(
		{ modkey, ctrlky, altkey },
		"Return",
		with_wrapper.shell(term_alacritty),
		{ description = "open nested tmx", group = "launcher" }
	),
	awful.key(
		{ modkey, ctrlky, shiftk },
		"Return",
		with_wrapper.shell(terminal .. " --name=MTX_UNO" .. term_mtx .. "mtx -n"),
		{ description = "open nested tmx", group = "launcher" }
	),
	awful.key(
		{ modkey, ctrlky },
		"Return",
		with_wrapper.shell(terminal .. " --name=MTX_UNO" .. term_mtx .. "mtx   "),
		{ description = "open nested tmx", group = "launcher" }
	),
	-- _______( { modkey, altkey         } , "Return", CLIENT_KEYS :: move to master mlib/keys_client.lua
	awful.key(
		{ modkey, shiftk },
		"Return",
		with_wrapper.shell(terminal),
		{ description = "open free term", group = "launcher" }
	),
	awful.key(
		{ modkey },
		"Return",
		with_wrapper.shell(terminal .. term_mtx),
		{ description = "open free term", group = "launcher" }
	),
	awful.key({ modkey, ctrlky }, "s", function()
		awful.spawn('scrot --line style=dash,width=4,color="' .. xc.wbg .. '" --select')
	end, { description = "screenshot", group = "launcher" }),
	-- ,awful.key( { modkey                    } , "Return", with_wrapper.term(),                                            { description = "open free term", group = "launcher"          } )
	-- , awful.key({ altkey } , "Menu",     root_leader)
	--
	-- , awful.key({ modkey, altkey } , "space",     root_leader)
	-- , awful.key({ altkey } , "Super_L" , with_wrapper.mtx('slave_tmux', 'toggle'))
	-- ,awful.key({ altkey } , "Tab"     , with_wrapper.mtx('master_tmux', 'toggle'))
	-- ,awful.key({ altkey } , "Escape"  , with_wrapper.mtx('slave_tmux', 'toggle'))
	awful.key({ modkey, ctrlky, shiftk }, "\\", with_wrapper.shell("dm-tool lock")),
	-- ---------
	-- TODO Sat Sep 25th
	awful.key({}, "KP_Insert", with_wrapper.shell("xdotool key Shift+grave")), -- 3

	-- awful.key({ } , "KP_Begin"             , with_wrapper.shell("xdotool key Up")), -- 7
	-- awful.key({ } , "KP_Begin"             , with_wrapper.shell("xdotool key Up")), -- 7
	-- awful.key({ } , "KP_Down"              , with_wrapper.shell("xdotool key Down")), -- 1
	-- awful.key({ } , "KP_Left"               , with_wrapper.shell("xdotool key Left")), -- 2
	-- awful.key({ } , "KP_Right"              , with_wrapper.shell("xdotool key Right")), -- 3
	-- awful.key({ } , "KP_Left"               , function () os.execute('xdotool key Left') end),
	-- awful.key({ } , "KP_Right"              , function () os.execute('xdotool key Right') end),

	awful.key({ modkey, ctrlky, shiftk }, "Left", with_wrapper.shell("playerctl -p spotify previous")),
	awful.key({ modkey, ctrlky, shiftk }, "Right", with_wrapper.shell("playerctl -p spotify next")),
	awful.key({ modkey, ctrlky, shiftk }, "Up", with_wrapper.shell("playerctl -p spotify play-pause")),
	awful.key({ modkey, ctrlky, shiftk }, "Down", with_wrapper.shell("amixer set Master toggle")),

	awful.key({}, "XF86AudioPrev", with_wrapper.shell("playerctl -p spotify previous")),
	awful.key({}, "KP_Home", with_wrapper.shell("playerctl -p spotify previous")),

	awful.key({}, "XF86AudioPlay", with_wrapper.shell("playerctl -p spotify play-pause")),
	awful.key({}, "KP_Up", with_wrapper.shell("playerctl -p spotify play-pause")),

	awful.key({}, "XF86AudioNext", with_wrapper.shell("playerctl -p spotify next")),
	awful.key({}, "KP_Prior", with_wrapper.shell("playerctl -p spotify next")),

	awful.key({}, "XF86AudioMute", with_wrapper.shell("amixer set Master toggle")),
	awful.key({}, "KP_Enter", with_wrapper.shell("amixer set Master toggle")),
	awful.key({}, "KP_Down", with_wrapper.shell("amixer set Master toggle")),

	awful.key({ modkey, ctrlky, shiftk }, "minus", with_wrapper.shell("amixer set Master 4%-")),
	-- awful.key({ } , "KP_Left"              , with_wrapper.shell("amixer set Master 1%-")) ,
	awful.key({}, "KP_Subtract", with_wrapper.shell("amixer set Master 2%-")),
	awful.key({}, "KP_End", with_wrapper.shell("amixer set Master 4%-")),
	awful.key({}, "XF86AudioLowerVolume", with_wrapper.shell("amixer set Master 4%-")),

	awful.key({ modkey, ctrlky, shiftk }, "equal", with_wrapper.shell("amixer set Master 4%+")),
	-- awful.key({ } , "KP_Right"             , with_wrapper.shell("amixer set Master 1%+")) ,
	awful.key({}, "KP_Add", with_wrapper.shell("amixer set Master 2%+")),
	awful.key({}, "KP_Next", with_wrapper.shell("amixer set Master 4%+")),
	awful.key({}, "XF86AudioRaiseVolume", with_wrapper.shell("amixer set Master 4%+")),

	-- with_prop_upd("opacity" , 1.0)
	awful.key({ modkey, ctrlky, altkey }, "equal", with_prop_upd("opacity", 0.05, true)),
	awful.key({ modkey, ctrlky, altkey }, "minus", with_prop_upd("opacity", -0.05, true)),

	awful.key({}, "XF86MonBrightnessUp", with_wrapper.shell("light -A               2")),
	awful.key({}, "XF86MonBrightnessDown", with_wrapper.shell("light -U               2")),
	awful.key({ modkey }, "Up", with_wrapper.shell("sudo light -A 2")),
	awful.key({ modkey }, "Down", with_wrapper.shell("sudo light -U 2")),

	--          KBD Brightness
	awful.key({}, "XF86KbdBrightnessUp", with_wrapper.shell("kbdlight up")),
	awful.key({}, "XF86KbdBrightnessDown", with_wrapper.shell("kbdlight down")),

	--          XRANDR
	awful.key({ modkey, ctrlky }, "F1", with_wrapper.shell("./dev/meta/mxrandr/f1-laptop.sh")),
	awful.key({ modkey, ctrlky }, "F2", with_wrapper.shell("./dev/meta/mxrandr/f2-screen.sh")),
	awful.key({ modkey, ctrlky }, "F3", with_wrapper.shell("./dev/meta/mxrandr/f3-dual.sh")),
	awful.key({ modkey, ctrlky }, "F4", with_wrapper.shell("./dev/meta/mxrandr/f4-single-hd.sh")),
	awful.key({ modkey, ctrlky }, "F5", with_wrapper.shell("./dev/meta/mxrandr/f5-dpi.sh")),
	-- ╰─ amixer -c 1 set Speaker toggle
	-- awful.key({ } , "XF86AudioStop"        , with_wrapper.shell("playerctl -p spotify stop")),
	-- amixer set Master toggle
	--                                                                                 "amixer -c 1 set Speaker toggle"
	-- awful.key({ modkey, ctrlky, shiftk}, "i", with_wrapper.shell("xcalib -invert -alter"))
	-- , awful.key({ modkey }, "b", function () mouse.screen.mywibox.visible = not mouse.screen.mywibox.visible end)
	awful.key({ modkey }, "h", awful.tag.viewprev, { description = "view previous", group = "tag" }),
	awful.key({ modkey }, "l", awful.tag.viewnext, { description = "view next", group = "tag" }),
	awful.key({ modkey, ctrlky, altkey }, "l", function()
		awful.spawn("xscreensaver-command -lock")
	end, { description = "view next", group = "tag" }),
	awful.key({ modkey }, ",", awful.tag.viewprev, { description = "view previous", group = "tag" }),
	awful.key({ modkey }, ".", awful.tag.viewnext, { description = "view next", group = "tag" }),
	awful.key({ modkey }, "Left", awful.tag.viewprev, { description = "view previous", group = "tag" }),
	awful.key({ modkey }, "Right", awful.tag.viewnext, { description = "view next", group = "tag" }),
	awful.key({ modkey }, "Escape", awful.tag.history.restore, { description = "go back", group = "tag" }),
	awful.key({ modkey }, "e", function()
		mmenus.mymainmenu:show()
	end, { description = "show app_menu", group = "awesome" }),
	awful.key({ modkey, shiftk }, "w", function()
		mmenus.all_menu()
	end, { description = "show all_menu", group = "awesome" }),
	awful.key({ modkey }, "w", function()
		mmenus.grd_menu()
	end, { description = "show grd_menu", group = "awesome" }),
	awful.key({ modkey, shiftk }, "s", with_wrapper.query_prompt("q"), { description = "mfz web", group = "launcher" }),
	awful.key({ modkey }, "s", with_wrapper.with_mfz("mfz-web"), { description = "mfz web", group = "launcher" }),
	awful.key({ modkey }, "u", awful.client.urgent.jumpto, { description = "jump to urgent client", group = "client" }),
	awful.key({ modkey, ctrlky }, "u", function()
		mouse.screen.mywibox.visible = not mouse.screen.mywibox.visible
	end, { description = "jump to urgent client", group = "client" }),

	-- {"w", function () mouse.screen.mywibox.visible = not mouse.screen.mywibox.visible end, "awm-wibar_toggle"}, desc = "awesome_wb" })

	-- ,awful.key({ modkey }, "w",    root_leader) awful.key({ modkey, ctrlky }, "e", function () awful.menu.clients() end, {description = "show main menu", group = "awesome"}),
	awful.key({ modkey }, "Tab", function()
		awful.client.focus.history.previous()
		if client.focus then
			client.focus:raise()
		end
	end, { description = "go back", group = "client" }),
	awful.key({ modkey, ctrlky }, "Tab", function()
		awful.client.getmaster():jump_to()
	end, { description = "jumpt_to master", group = "client" }),
	-- , awful.key({ modkey , ctrlky }   , "r" , awesome.restart , {description = "reload awesome" , group = "awesome"})
	awful.key({ modkey, ctrlky }, "r", function()
		awful.spawn("random-frame /usr/local/meta/tr/Cyberpunk-Edgerunners /home/meta/pics/wall/curr-1.png")
		awesome.restart()
	end, { description = "reload awesome", group = "awesome" }),
	awful.key({ modkey, shiftk }, "q", awesome.quit, { description = "quit awesome", group = "awesome" }),
	-- >>
	-- , awful.key( { modkey, altkey           } , "j", _w.relative_screen_focus( 1), { description = "focus the next screen", group = "screen"                    } )
	-- , awful.key( { modkey, altkey           } , "k", _w.relative_screen_focus(-1), { description = "focus the previous screen", group = "screen"                } )
	awful.key({ modkey }, "j", _w.relative_client_focus(1), { description = "focus next by index", group = "client" }),
	awful.key(
		{ modkey },
		"k",
		_w.relative_client_focus(-1),
		{ description = "focus previous by index", group = "client" }
	),
	awful.key(
		{ modkey, shiftk },
		"h",
		_w.mv_top_left(),
		{ description = "increase the number of master   clients", group = "layout" }
	),
	awful.key(
		{ modkey, shiftk },
		"l",
		_w.mv_top_right(),
		{ description = "decrease the number of master clients", group = "layout" }
	),
	awful.key(
		{ modkey, shiftk },
		"j",
		_w.mv_bottom_left(),
		{ description = "swap with  next client by index", group = "client" }
	),
	awful.key(
		{ modkey, shiftk },
		"k",
		_w.mv_bottom_right(),
		{ description = "swap with  previous client by index", group = "client" }
	),
	awful.key({ modkey, ctrlky }, "k", _w.dech(), { description = "increase client width factor", group = "layout" }),
	awful.key({ modkey, ctrlky }, "j", _w.inch(), { description = "decrease client width factor", group = "layout" }),
	awful.key({ modkey, ctrlky }, "l", _w.incw(), { description = "increase master width factor", group = "layout" }),
	awful.key({ modkey, ctrlky }, "h", _w.decw(), { description = "decrease master width factor", group = "layout" }),
	awful.key(
		{ modkey, ctrlky, shiftk },
		"h",
		_w.incncol(),
		{ description = "increase the number of columns", group = "layout" }
	),
	awful.key(
		{ modkey, ctrlky, shiftk },
		"l",
		_w.decncol(),
		{ description = "decrease the number of columns", group = "layout" }
	),
	awful.key(
		{ modkey, ctrlky, shiftk },
		"j",
		_w.relative_screen_focus(1),
		{ description = "focus next by index", group = "screen" }
	),
	awful.key(
		{ modkey, ctrlky, shiftk },
		"k",
		_w.relative_screen_focus(-1),
		{ description = "focus previous by index", group = "screen" }
	),
	-- , awful.key( { modkey , shiftk }, "Escape"      , _w.relative_screen_focus( 1) , { description = "focus next by index"     , group = "screen" } )
	awful.key(
		{ modkey, altkey },
		"Escape",
		_w.relative_screen_focus(1),
		{ description = "focus next by index", group = "screen" }
	),
	awful.key(
		{ modkey },
		"Caps_Lock",
		_w.relative_screen_focus(1),
		{ description = "focus next by index", group = "screen" }
	),
	awful.key(
		{ modkey },
		"BackSpace",
		_w.relative_screen_focus(1),
		{ description = "focus next by index", group = "screen" }
	),
	-- Control+Mod4 + Caps_Lock /
	-- <<
	awful.key({ modkey }, "space", function()
		awful.layout.inc(1)
	end, {
		description = "select next",
		group = "layout",
	}),
	awful.key({ modkey, shiftk }, "space", function()
		awful.layout.inc(-1)
	end, {
		description = "select previous",
		group = "layout",
	}),

	awful.key({ modkey, ctrlky }, "n", function()
		local c = awful.client.restore()
		if c then
			c:emit_signal("request::activate", "key.unminimize", { raise = true })
		end
	end, { description = "restore minimized", group = "client" }),

	awful.key({ modkey }, "p", function()
		menubar.show()
	end, { description = "show the menubar", group = "launcher" })

	-- awful.key({ modkey, shiftk }, "c", function () awful.spawn(chromium) end),
	----------------------------------------------------------------------------------------------------

	----------------------------------------------------------------------------------------------------
	-- awful.key({        }    , "KP_Divide"   , with_wrapper.mtx('master_tmux', 'toggle')) ,
	-- awful.key({        }    , "KP_Multiply" , with_wrapper.mtx('slave_tmux', 'toggle'))
	-- ---------
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
	globalkeys = gears.table.join(
		globalkeys,
		-- View tag only.
		awful.key({ modkey }, "#" .. i + 9, function()
			local screen = awful.screen.focused()
			local tag = screen.tags[i]
			if tag then
				tag:view_only()
			end
		end, { description = "view tag #" .. i, group = "tag" }),
		-- Toggle tag display.
		awful.key({ modkey, ctrlky }, "#" .. i + 9, function()
			local screen = awful.screen.focused()
			local tag = screen.tags[i]
			if tag then
				awful.tag.viewtoggle(tag)
			end
		end, { description = "toggle tag #" .. i, group = "tag" }),
		-- Move client to tag.
		awful.key({ modkey, shiftk }, "#" .. i + 9, function()
			if client.focus then
				local tag = client.focus.screen.tags[i]
				if tag then
					client.focus:move_to_tag(tag)
				end
			end
		end, { description = "move focused client to tag #" .. i, group = "tag" }),
		-- Toggle tag on focused client.
		awful.key({ modkey, ctrlky, shiftk }, "#" .. i + 9, function()
			if client.focus then
				local tag = client.focus.screen.tags[i]
				if tag then
					client.focus:toggle_tag(tag)
				end
			end
		end, { description = "toggle focused client on tag #" .. i, group = "tag" })
	)
end

return globalkeys

-- ,awful.key({ modkey, altkey }, "space",     root_leader)
-- ,awful.key({ altkey } , "Shift_R" , with_wrapper.mtx('master_tmux', 'toggle'))
-- ,awful.key({ altkey } , "Menu"    , with_wrapper.mtx('slave_tmux', 'toggle'))
-- ,awful.key({ altkey } , "Tab"     , with_wrapper.mtx('master_tmux', 'toggle'))
-- ,awful.key({ altkey } , "Escape"  , with_wrapper.mtx('slave_tmux', 'toggle'))
