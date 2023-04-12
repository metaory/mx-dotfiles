-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
local awesome, client, mouse, screen, tag = awesome, client, mouse, screen, tag
local ipairs, string, os, table, tostring, tonumber, type = ipairs, string, os, table, tostring, tonumber, type

pcall(require, "luarocks.loader")

-- local termgrp = require('termgrp')

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
-- local lain = require("lain")
require("awful.autofocus")
local wibox = require("wibox")
local thm = require("beautiful")
local xresources = require("beautiful.xresources")
xc = xresources.get_current_theme()
-- {{{ Variable definitions
-- thm.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")
thm.init("/home/meta/.config/awesome/themes/meta/theme.lua")
-- local bling = require("bling")

modkey = "Mod4"
-- }}}
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
local naughty = require("naughty")

local snap = require("awful.mouse.snap")

require("awful.hotkeys_popup.keys")

os.execute("logger '#########################'")
os.execute("logger '##  [[ AWM_RESTART ]]  ##'")
os.execute("logger '#########################'")
gears.debug.print_warning("#########################")
gears.debug.print_warning("##  [[ AWM_RESTART ]]  ##")
gears.debug.print_warning("#########################")

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
	naughty.notify({
		preset = naughty.config.presets.critical,
		title = "Oops, there were errors during startup!",
		text = awesome.startup_errors,
	})
end -- [[ -- Handle runtime errors after startup ]]
--
do
	local in_error = false
	awesome.connect_signal("debug::error", function(err) -- Make sure we don't go into an endless error loop
		if in_error then
			return
		end
		in_error = true
		naughty.notify({
			preset = naughty.config.presets.critical,
			title = "Oops, an error happened!",
			text = tostring(err),
		})
		in_error = false
	end)
end
-- }}}

-- {{{ Globals
-- os.execute("EDITOR=nvim")
-- terminal     = "kitty"
-- kitty_single_instance = "kitty --single-instance --listen-on=unix:/tmp/mykitty"

-- term_uno = "kitty --single-instance --listen-on=unix:/tmp/kitty-uno"
-- term_mst = "kitty --single-instance --listen-on=unix:/tmp/kitty-master"

-- term_mtx = " --single-instance --listen-on=unix:/tmp/kitty-mtx "
-- term_uno = " --single-instance --listen-on=unix:/tmp/kitty-mtx "
-- term_mst = " --single-instance --listen-on=unix:/tmp/kitty-mtx "

term_mtx = " "
term_uno = " "
term_mst = " "
terminal = "kitty "
-- terminal = "alacritty "

term_kitty = "kitty"
term_termite = "termite"
term_alacritty = "alacritty"
editor = os.getenv("EDITOR") or "nvim"
editor_cmd = terminal .. " -e " .. editor
slack = "slack --force-device-scale-factor=1.5"
atom = "atom"
kt_m_opt = " -o 'initial_window_height 20c' -o 'initial_window_width 130c' "
al_m_opt =
	" --option window.position.x=0 window.position.y=30 window.dimensions.columns=175 window.dimensions.lines=23 -e"
MX = {}
MX.kitty_opt_h = " -o background='" .. xc.sk2 .. "' "
MX.kitty_opt_c = " -o color4='" .. xc.sk4 .. "' "
-- MX.kitty_opt_h = " -o font_size=14 -o background='"..xc.color0.."' "

ranger = terminal .. kt_m_opt .. MX.kitty_opt_h .. " -T ranger ranger "
nnn = terminal .. kt_m_opt .. " -T nnn nnn"
rtorrent = terminal .. kt_m_opt .. " -T rtorrent rtorrent"
chromium = "chromium"
netflix = chromium .. "  --app=https://www.netflix.com"
youtube = chromium .. "  --app=https://www.youtube.com"
trello = chromium .. "  --app=https://trello.com/b/fupVABbK/meta"
soundcloud = chromium .. "  --app=https://soundcloud.com/you/likes"
awful.util.terminal = terminal
snap.default_distance = 30
snap.edge_enabled = true
snap.client_enabled = true
mdbg_p = gears.debug.print_warning
mdbg_t = function(data, tag, notif)
	local s = gears.debug.dump_return(data, " >> " .. string.upper(tag), 3)
	mdbg_p(s)
end

-- local battery_widget = require("widgets.battery-widget.battery")

local bat_widget = require("mwidgets.batteryarc-widget.batteryarc")
local mem_widget = require("mwidgets.ram-widget.ram-widget")

-- local cal_widget = require("mwidgets.calendar-widget.calendar")
-- local pom_widget = require("mwidgets.pomodoroarc-widget.pomodoroarc")

get_screen = function(s)
	return s and screen[s]
end
m_filter_mtx = function(c, screen)
	return awful.rules.match_any(c, { instance = { "MTX_MASTER", "MTX_SLAVE", "MTX_UNO" } })
end
m_filter_mfz = function(c, screen)
	return awful.rules.match_any(c, { instance = { "MFZ" } })
end
m_filter_etc = function(c, screen)
	return (not m_filter_mtx(c) and not m_filter_mfz(c))
end

require("mlib/with_wrapper")
-- require('mlib/keys_xleader')
require("mlib/keys_leader")
-- require('mlib/keys_leader-slave')
local globalkeys = require("mlib/keys_global")
require("mlib/mpad")
-- local clientkeys = require('mlib/keys_client')

-- local clientkeys = require("clientkeys")

-- clientbuttons = gears.table.join(
--   awful.button({ }, 1, function (c) c:emit_signal("request::activate", "mouse_click", {raise = true}) end),
--   awful.button({ modkey }, 1, function (c) c:emit_signal("request::activate", "mouse_click", {raise = true}) awful.mouse.client.move(c) end),
--   awful.button({ modkey }, 3, function (c) c:emit_signal("request::activate", "mouse_click", {raise = true}) awful.mouse.client.resize(c) end)
--  )
-- require('mlib/keys_client')
-- globalkeys = gears.table.join(require('mlib/keys_global') )
require("mlib/layouts")

local mtags = require("mlib/mtags")
local mrules = require("mlib/mrules")
local mmenus = require("mlib/menus")

-- Menubar configuration
-- menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- ##########################################################################################
-- local cairo      = require( "lgi"            ).cairo
-- local img = cairo.ImageSurface.create(cairo.Format.ARGB32, 1000, 50) -- Create a surface
-- local cr  = cairo.Context(img) -- Create a context
-- cr:set_source(cairo.Pattern.create_rgba(100,10,10,0.1))
-- cr:set_source(gears.color({ type = "radial", from = { 40, 40, 10 }, to = { 35, 35, 30 }, stops = { { 0, "#ff0000" }, { 0.5, "#00ff00" }, { 1, "#0000ff" } } }))
-- cr:set_source(gears.color.create_opaque_pattern({ type = "linear", from = { 0, 0 }, to = { 100, 50 }, stops = { { 0, gears.color.parse_color("#414ea9b3") },  { 1, gears.color.parse_color("#414ea9") } }}))
-- cr:set_source(gears.color.create_opaque_pattern({ type = "linear", from = { 0, 0 }, to = { 100, 50 }, stops = { { 0, "#414ea9b3" }, { 0.5, "#1889F2" }, { 1, "#414ea9" }}}))
-- cr:set_source(gears.color.create_pattern({ type = "linear"
-- local mx_solid_pat_rgba = cairo.Pattern.create_rgba(gears.color.parse_color('#414ea9b3'))
-- local mx_solid_pat_rgba = grears.color.create_pattern('#ff1fb9d9')
-- return cairo.Pattern.create_rgba(color.parse_color(col))
-- cr:set_source(mxpattern)
-- cr:set_source(gears.color("#ff0000"))
--cairo.Pattern.create_rgba(color.parse_color(col))
-- cairo_set_source_rgba
-- ##########################################################################################

-- Keyboard map indicator and switcher
-- Create a wibox for each screen and add it
tasklist_buttons = gears.table.join(
	awful.button({}, 1, function(c)
		if c == client.focus then
			c.minimized = true
		else
			c:emit_signal("request::activate", "tasklist", { raise = true })
		end
	end),
	-- awful.button({ }, 3, function() awful.menu.client_list({ theme = { width = 250 } }, nil, m_filter_etc) end),
	-- awful.button({ }, 2, function() awful.menu.client_list({ theme = { width = 250,  } }, {icon = ''}, m_filter_mfz) end),
	awful.button({}, 4, function()
		awful.client.focus.byidx(1)
	end),
	awful.button({}, 5, function()
		awful.client.focus.byidx(-1)
	end)
)

mykeyboardlayout = awful.widget.keyboardlayout()
-- "<span size='small' stretch='ultracondensed'>%a.%b.%d</span>"..
-- string.format("<span color='%s' size='small' stretch='ultracondensed'>", xc.color7)..
mytextclock = wibox.widget.textclock(
	"<span color='"
		.. xc.color7
		.. "' size='small' stretch='ultracondensed'>%a</span>"
		.. "<span color='"
		.. xc.color8
		.. "' size='small' stretch='ultracondensed'> %b%d</span>"
		.. "<span color='"
		.. xc.wbg
		.. "'> %H</span>"
		.. "<span color='"
		.. xc.color8
		.. "' size='small'>:</span>"
		.. "<span color='"
		.. xc.color7
		.. "'>%M</span>"
)

-- mxsystray.forced_height = 4
mbatwidget = bat_widget()
mmemwidget = mem_widget()
require("mlib/mpopup")

local msig = require("mlib/msig")

-- mysystray.forced_height = 60

-- [[ ########################################
-- [[ ########################################
-- [[ ########################################
-- [[ >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
awful.screen.connect_for_each_screen(msig.sconnect)
-- }}}
-- [[ <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
-- [[ ########################################
-- [[ ########################################
-- [[ ########################################

-- {{{ Mouse bindings
root.buttons(gears.table.join(
	awful.button({}, 3, function()
		mmenus.mymainmenu:toggle()
	end),
	awful.button({}, 4, awful.tag.viewnext),
	awful.button({}, 5, awful.tag.viewprev)
))
-- }}}

-- ############################################################### --
-- --------------------------------------------------------------- --
-- ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --
-- ############################################################### --
-- local client_leader = leader.leader(
--   leader.wrap(
--     leader.repeat_count,
--     leader.bind({
--         {"m", move_client_keys, "Move Leader"},
--   }))
-- )
-- ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --
-- client:disconnect_signal
-- #############################################################################
-- local with_connect = function(name, fn) client.connect_signal(name, fn) end
-- local with_disconnect = function(name, fn) client.disconnect_signal(name, fn) end
--       {"m"                    , with_connect('mouse::enter', mousefocus_sg), "connect_mouse_focus"}   ,
--       {"M"                    , with_disconnect('mouse::enter', mousefocus_sg), "dissconnect_mouse_focus"}   ,
-- client.connect_signal("mouse::enter", function(c)
--     c:emit_signal("request::activate", "mouse_enter", {raise = false})
-- end)
-- #############################################################################
-- ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --

-- ############################################################### --
-- local term_leader = leader.leader( leader.wrap( leader.repeat_count, leader.bind({ {"Menu", term_keys, "tmux_leader"}, })) )
-- ############################################################### --
-- {{{ Key bindings

-- {{{ Rules
mrules.setrules()
-- }}}
--
-- {{{ Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Signals
-- p

client.connect_signal("property::ontop", msig.mmanage_border)
client.connect_signal("property::maximized", msig.mmanage_border)
client.connect_signal("focus", msig.mmanage_border)
client.connect_signal("unfocus", msig.mmanage_border)

client.connect_signal("manage", function(c)
	-- if not awesome.startup then awful.client.setslave(c) end
	if awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
		awful.placement.no_offscreen(c) -- Prevent clients from being unreachable after screen count changes.
	end
end)
-- }}}
--
