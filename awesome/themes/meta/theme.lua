-- gears.shape.isosceles_triangle(cr, w, 4)
-- gears.shape.rounded_rect(cr, w, 4)
-- gears.shape.isosceles_triangle(cr, w, 4)
-- gears.shape.rounded_rect(cr, w, 4)
-- gears.shape.isosceles_triangle(cr, w, 4)
-- gears.shape.rounded_rect(cr, w, 4)
-- gears.shape.isosceles_triangle(cr, w, 4)
-- gears.shape.rounded_rect(cr, w, 4)
-- gears.shape.isosceles_triangle(cr, w, 4)
-- gears.shape.rounded_rect(cr, w, 4)
-- gears.shape.isosceles_triangle(cr, w, 4)
-- gears.shape.rounded_rect(cr, w, 4)
-- gears.shape.isosceles_triangle(cr, w, 4)
-- gears.shape.rounded_rect(cr, w, 4)
-- gears.shape.isosceles_triangle(cr, w, 4)
-- gears.shape.rounded_rect(cr, w, 4)
-- gears.shape.isosceles_triangle(cr, w, 4)
-- gears.shape.rounded_rect(cr, w, 4)
-- gears.shape.isosceles_triangle(cr, w, 4)
-- gears.shape.rounded_rect(cr, w, 4)
-- gears.shape.isosceles_triangle(cr, w, 4)
-- gears.shape.rounded_rect(cr, w, 4)
-- gears.shape.isosceles_triangle(cr, w, 4)
-- gears.shape.rounded_rect(cr, w, 4)
-- gears.shape.isosceles_triangle(cr, w, 4)
-- gears.shape.rounded_rect(cr, w, 4)
-- gears.shape.isosceles_triangle(cr, w, 4)
-- gears.shape.rounded_rect(cr, w, 4)
-- gears.shape.isosceles_triangle(cr, w, 4)
-- gears.shape.rounded_rect(cr, w, 4)
-- gears.shape.isosceles_triangle(cr, w, 4)
-- gears.shape.rounded_rect(cr, w, 4)
-- gears.shape.isosceles_triangle(cr, w, 4)
-- gears.shape.rounded_rect(cr, w, 4)
-- gears.shape.isosceles_triangle(cr, w, 4)
-- gears.shape.rounded_rect(cr, w, 4)
-- gears.shape.isosceles_triangle(cr, w, 4)
-- gears.shape.rounded_rect(cr, w, 4)
-- gears.shape.isosceles_triangle(cr, w, 4)
-- gears.shape.rounded_rect(cr, w, 4)
-- gears.shape.isosceles_triangle(cr, w, 4)
-- gears.shape.rounded_rect(cr, w, 4)
-- gears.shape.isosceles_triangle(cr, w, 4)
-- gears.shape.rounded_rect(cr, w, 4)
-- gears.shape.isosceles_triangle(cr, w, 4)
-- gears.shape.rounded_rect(cr, w, 4)
-- gears.shape.isosceles_triangle(cr, w, 4)
-- gears.shape.rounded_rect(cr, w, 4)
-- gears.shape.isosceles_triangle(cr, w, 4)
-- gears.shape.rounded_rect(cr, w, 4)
-- gears.shape.isosceles_triangle(cr, w, 4)
-- gears.shape.rounded_rect(cr, w, 4)
---------------------------
-- Default awesome theme --
---------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
-- local dpi = xresources.apply_dpi
local xc = xresources.get_current_theme()
local mtheme = require("../../mtheme")

local gears = require("gears")
local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()

local theme = {}
theme.search = mtheme.search

theme.xc = xc
local pl = {}

-- #############################################################
-- , Black      , Black Italic
-- , Bold       , Bold Italic
-- , Semibold   , Semibold Italic
-- , Medium     , Medium Italic
-- , Regular    , Italic
-- , Light      , Light Italic
-- , ExtraLight , ExtraLight Italic

-- local old_font_family  = "FiraMono Nerd Font Mono"

-- march-21 --##################################################
-- local font_size=16
-- local font_family  = "SauceCodePro Nerd Font"
-- theme.font_small   = font_family .. " Mono Medium 12"
-- theme.font         = font_family .. " Mono Bold 16"
-- theme.font_black   = font_family .. " Mono Black 16"
-- theme.font_large   = font_family .. " Mono Bold 18"
-- theme.font_larger  = font_family .. " Mono Bold 24"
-- theme.font_largest = font_family .. " Mono Bold 26"
-- #############################################################

-- march-21 --##################################################
-- # DEV_3
-- font_family      Sauce Code Pro Medium Nerd Font Complete
-- bold_font        Sauce Code Pro Bold Nerd Font Complete
-- italic_font      Sauce Code Pro Medium Italic Nerd Font Complete
-- bold_italic_font Sauce Code Pro Bold Italic Nerd Font Complete

-- local font_size=16
-- local font_family  = "Sauce Code Pro Medium Nerd Font Complete"
-- local font_family = "Sauce Code Pro Bold Nerd Font Complete Mono "
--
-- local ff   = "SauceCodePro Nerd Font Mono "
local ffp = "ProggyCleanTT Nerd Font Mono "
local ffa = "agave Nerd Font "
local ffi = "FiraMono Nerd Font Mono "
local ffw = "Play "

local fs = 16
-- theme.wibar_height = 46 -- 2.875
-- theme.wibar_height = fs *  2.875 --[[ 16 * 2.875 = 46 ]]
--

-- theme.arc_size = 28
-- theme.arc_size = fs*2

-- local fs=28
theme.wibar_height = 60
-- theme.wibar_height = fs *  2.875 [> 16 * 2.875 = 46 <]
-- theme.arc_size = 32
theme.arc_size = fs * 2.5

theme.arc_thickness = 6

theme.wibar_ontop = true
theme.wibar_opacity = 0.8
theme.wibar_stretch = true
-- theme.wibar_border_width = 4

local font_small = ffp .. "Regular " .. (fs + math.floor(1 * -2)) -- 2)
-- local font_normal  = ffp .. "Regular "..(fs+math.floor(1*  2))  -- 2)
local font_normal = ffa .. "r 12"
local font_focus = ffa .. "r 12"
-- local font_focus   = ffp ..     "Bold "..(fs+math.floor(1*  2))  -- 2)
local font_large = ffa .. "Bold " .. (fs + math.floor(1 * 6)) -- 8)
local font_black = ffw .. "Bold " .. (fs + math.floor(1 * 14)) -- 16)
theme.taglist_font = ffi .. "Bold " .. (fs + math.floor(1 * 12)) -- 8)
theme.font_widget = ffw .. "Bold 8"

theme.font = font_large
theme.font_normal = font_normal
theme.font_focus = font_focus
theme.font_small = font_small
theme.font_large = font_large
theme.font_larger = font_large
theme.font_largest = font_large

-- #############################################################
--
theme.arc_font = theme.font_widget
theme.tasklist_font = font_normal -- "FiraMono Nerd Font Medium 12"
theme.tasklist_font_focus = font_focus -- "FiraMono Nerd Font Bold 14"
theme.hotkeys_font = font_black
theme.hotkeys_description_font = font_large
theme.tooltip_font = font_normal
theme.notification_font = font_normal
theme.layoutlist_font = font_large
theme.prompt_font = font_focus
-- theme.layoutlist_spacing      = 20
-- theme.layoutlist_disable_icon = true
-- theme.layoutlist_disable_name = true
-- theme.taglist_squares_resize  = true

-- #############################################################

--  #16a085 fg acnt

--  #a9b1d6 fg actv

--  #1a1b26 bg base
--  #171821 bg actv
--  #1e1f2a bg fade

--  #4c566a fg base
--  #16a085 fg actv
--  #2d3843 fg fade
-- pl.xbg_fade = "#1e1f2a" -- bg fade

-- pl.xfg_normal   = "#4c566a" -- fg base
-- ---------------------
--
theme.red_x = mtheme.colors.per_dark
theme.zero = xc.color0 or "#84bd17"
theme.grey = xc.color7 or "#84bd17"
theme.red_d = xc.color1 or "#84bd17"
theme.red_l = xc.color1 or "#84bd17"
theme.green_d = xc.color2 or "#84bd17"
theme.green_l = xc.color10 or "#84bd17"
theme.yellow_x = xc.color3 -- mtheme.colors.yellow_dark or '#84bd17'
theme.yellow_d = xc.color3 or "#84bd17"
theme.yellow_l = xc.color11 or "#84bd17"
theme.blue_d = xc.color4 or "#84bd17"
theme.blue_l = xc.color12 or "#84bd17"
-- theme.blu    = "#005fdf"

-- theme.magenta_l = xc.color5      or        '#84bd17'
-- theme.magenta_d = xc.color13     or        '#84bd17'
theme.cyan_d = xc.color6 or "#84bd17"
theme.cyan_l = xc.color14 or "#84bd17"
theme.prpl_d = xc.color5 or "#84bd17" -- "#5F5FD7"
theme.prpl_l = xc.color13 or "#84bd17" -- "#5F5FD7"
theme.prp = xc.prp or "#5F5FD7" -- mx1
theme.blu = xc.blu or "#005fdf" -- mx2
theme.ebg = xc.ebg or "#f00000" -- mx3
theme.efg = xc.efg or "#f00000" -- mx3
theme.wbg = xc.wbg or "#f00000" -- mx3
theme.wfg = xc.wfg or "#f00000" -- mx3
theme.sbg = xc.sbg or "#f00000" -- mx3
theme.sfg = xc.sfg or "#f00000" -- mx3

-- theme.blu       = theme.blue_l

theme.fg_activity = theme.prpl_d
theme.bg_activity = theme.cyan_l

-- 355070
pl.term_bg = "#1b1c27"

pl.xmain_1 = xc.prp
pl.xmain_2 = xc.blu
theme.accent = xc.sbg
-- pl.xmain_1 = "#16a085"
-- pl.xmain_2 = "#00acbd"
--
pl.xfg_normal = xc.foreground
pl.xbg_normal = xc.background
pl.xbg_actv = xc.sk0
pl.xfg_focus = xc.wbg
-- ++++ <

-- -- pl.xfg_fade   = "#2e2e40" -- #2e2e40  ct $(ct 5F5FD7 s -50% ) v -70%
-- -- pl.xbg_fade   = "#222230" -- ← TODO REMOVE ME ←
-- -- pl.xfg_dark   = pl.xfg_fade
-- -- pl.xbg_dark   = "#15151f" -- #15151f  ct 1c1c2a v -25%

-- -- pl.xshade_0    = "#15161E" --
-- -- pl.xshade01    = "#191A24" --
-- -- pl.xshade_1    = "#1f202d" --
-- -- pl.xshade_2    = "#232433" -- <<
-- -- pl.xshade_3    = "#30324A" --

pl.xfg_fade = xc.sk3 -- "#2e2e40" -- #2e2e40  ct $(ct 5F5FD7 s -50% ) v -70%
pl.xbg_fade = xc.sk2 -- "#222230" -- ← TODO REMOVE ME ←
pl.xfg_dark = xc.sk2 -- pl.xfg_fade
pl.xbg_dark = xc.sk1 -- "#15151f" -- #15151f  ct 1c1c2a v -25%

pl.xshade_0 = xc.sk0
pl.xshade_1 = xc.sk1
pl.xshade_2 = xc.sk2
pl.xshade_3 = xc.sk3
pl.xshade_4 = xc.sk4

theme.xshade_0 = pl.xshade_0
theme.xshade_1 = pl.xshade_1
theme.xshade_2 = pl.xshade_2
theme.xshade_3 = pl.xshade_3
theme.lshade_6 = xc.wk6

theme.fg_fade = pl.xfg_fade
theme.bg_fade = pl.xbg_fade
theme.fg_dark = pl.xfg_dark
theme.bg_dark = pl.xbg_dark
--
theme.bg_normal = pl.xbg_normal -- "#17171c" -- 060A0C -- theme.bg_normal = "#090E0F" -- 060A0C
theme.bg_focus = pl.xbg_actv -- "#121212" -- theme.bg_focus               = "#000000"
theme.bg_mtx = xc.color0
theme.bg_minimize = pl.xbg_normal

theme.fg_normal = pl.xfg_normal
theme.fg_focus = pl.xfg_focus
theme.fg_flags = xc.ebg -- theme.cyan_d
theme.fg_minimize = pl.xfg_fade
--
theme.fg_mtxi_normal = xc.ebg -- theme.fg_normal
theme.fg_mtxi_focus = xc.wbg
-- local fg_mtxi_normal = gcolor.ensure_pango_color(args.fg_mtxi_normal or theme.fg_normal, "white")
-- local fg_mtxi_focus = gcolor.ensure_pango_color(args.fg_mtxi_focus or theme.prp,  "red")
--
theme.xmain_1 = pl.xmain_1
theme.xmain_2 = pl.xmain_2
theme.xhigh_1 = theme.prpl_d
theme.xhigh_2 = pl.xyellow
theme.xcritical = theme.red_d
theme.xwarning = theme.prpl_d
pl.xhighlight = theme.red_d -- "#c0392b" -- "#e74c3c" "#C0392B" -- "#C62828"
pl.xyellow = "#b9f27c" -- "#c0392b" -- "#e74c3c" "#C0392B" -- "#C62828"
-- -------------------------------------------------------------------------- --

local HOME = os.getenv("HOME")
theme.confdir = HOME .. "/.config/awesome/themes/meta"
local walldir = HOME .. "/pics/wall/"
theme.ICO_PATH = HOME .. "/.icons/oomox-root_2021_beta/status/scalable/"

-- theme.wallpaper = theme.confdir .. "/wall/curr.png"
--
-- theme.wallpaper = walldir       .. "/curr.png"
-- os.execute       ("logger '##  [[ SET WALL ]]  ##"..s.index.."'")
-- gears.debug.print_warning('--====--')

theme.wallpaper = function(s)
	local geo = s.geometry
	local wp = geo.width > geo.height and "curr-1.png" or "curr-2.png"
	return walldir .. wp
end
-- theme.wallpaper = walldir       .. "/curr_blurr.png"

-- theme.icon_theme                     = "Adwaita"
-- theme.icon_theme                     = "oomox-root-1-flat"
-- theme.font                           = "fira mono 14"
-- theme.font_large                     = "fira momo bold 24"

-- theme.font                           = "FiraMono Nerd Font Mono Medium 14"
-- theme.font_large                     = "FiraMono Nerd Font Mono Bold 24"

--[[ -- 0.2
theme.font                           = "Noto Sans Mono Medium 14"
theme.font_large                     = "NotoSans Nerd Font ExtraBold 24"
theme.font_small                     = "Noto Sans Mono Medium 12"
]]

--
-- theme.font_large                     = "Fira Mono Bold 26"
-- [> font = FiraMono Nerd Font Medium 14 <]
-- theme.menu_bg_focus                  = "#060A0C"
-- theme.menu_bg_normal                 = "#060A0C"

-- theme.font_small        = "Fira Mono Medium 22"
-- theme.font              = "Fira Mono Medium 14"
-- theme.font              = "Fira Mono Medium 14"
--
--SauceCodePro Nerd Font

-- #############################################################
-- theme.font_small           = "Fira Code Light 4"
-- theme.font                 = "FiraMono Nerd Font Mono Medium 12"
-- theme.font_large           = "FiraMono Nerd Font Mono Bold   20"
-- theme.font_largest          = "FiraMono Nerd Font Mono Bold   24"
-- #############################################################

--
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- prompt_fg = pl.xmain_2
-- tooltip_opacity = 0.5
-- -- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- theme.hotkeys_fg               = theme.blu

theme.bg_urgent = xc.cx1 -- "#C0392B" -- "#C62828"
theme.fg_urgent = xc.cx3
theme.bg_separator = pl.xmain_2 -- "#14171a"

-- blind/arrow/themeZilla.lua:341:    bg_normal  = { type = "linear", from = { 0, 0 }, to = { 0, default_height }, stops = { { 0, "#373E44" }, { 1, "#101214" }}},
-- theme.bg_normal  = { type = "linear", from = { 0, 0 }, to = { 0, default_height }, stops = { { 0, "#00AF5F" }, { 1, "##5F5FD7" }}},
-- theme.font_largest         = theme.font_largest
theme.hotkeys_bg = xc.wk3
theme.hotkeys_fg = theme.fg_focus
theme.hotkeys_label_fg = "#000000"
theme.hotkeys_description_fg = pl.xhighlight
theme.hotkeys_modifiers_fg = xc.wbg

-------------------------
--
-- titlebar_[bg|fg]_[normal|focus]
--
theme.titlebar_bg = pl.xbg_actv
theme.titlebar_fg = pl.xfg_normal
theme.titlebar_normal = pl.xbg_fade
theme.titlebar_focus = pl.xhighlight
-------------------------
-------------------------

-- tasklist_[bg|fg]_[focus|urgent]

-- theme.tasklist_bg_activity = theme.red_d -- theme.magenta_d
-- theme.tasklist_fg_activity = theme.yellow_d
-- theme.tasklist_bg_normal   = xc.color7
-- theme.tasklist_fg_normal   = xc.color7
-- theme.tasklist_bg_minimize = xc.color8
-- theme.tasklist_fg_minimize = xc.color8
-- theme.tasklist_bg_urgent   = pl.xhighlight
-- theme.tasklist_fg_urgent   = pl.xhighlight
-- theme.tasklist_bg_focus    = xc.sbg
-- theme.tasklist_fg_focus    = xc.wbg

theme.tasklist_bg_activity = xc.color1
theme.tasklist_fg_activity = xc.color0
theme.tasklist_bg_normal = xc.background
theme.tasklist_fg_normal = xc.color7
theme.tasklist_bg_minimize = xc.color0
theme.tasklist_fg_minimize = xc.wk6
theme.tasklist_bg_urgent = xc.ebg
theme.tasklist_fg_urgent = xc.efg
theme.tasklist_bg_focus = xc.wk0
theme.tasklist_fg_focus = xc.wbg

-- theme.tasklist_shape = gears.shape.rounded_bar

-- theme.tasklist_shape = function(cr, w, h)
-- 	return
-- 		-- gears.shape.isosceles_triangle(cr, w, 4)
-- 		-- gears.shape.rounded_rect(cr, w, 4)
-- 		-- gears.shape.circle(cr, w, h, 20)
-- end
-- local gcolor = require("gears.color")
local _shape_soft = function(cr, w, h)
	gears.shape.rounded_rect(cr, w, h, 26)
end
theme.tasklist_shape_focus = _shape_soft
-- theme.tasklist_shape_focus = function(cr, w, h)
-- gears.shape.rect(cr, w, h)
-- cr:fill()
-- gears.shape.transform(gears.shape.rounded_rect(cr, w, 8, 0))
-- : rotate(10, 10, math.pi/2)
-- : translate(2, 2)
-- return gears.shape.rounded_rect(cr, w, h, 16)
-- return gears.shape.rounded_rect(cr, w, 4, 0)
-- gears.shape.isosceles_triangle(cr, 90, 40)
-- gears.shape.rounded_rect(cr, w, 4):fill(gears.color.parse_color("#00ff00ff"))

-- shape.radial_progress(cr, 70, 20, .6)

-- gears.shape.rounded_rect(cr, w, 4, 0)
-- gcolor.ensure_pango_color
-- gears.shape.rounded_rect(cr, w, 4)
-- local gz = gears.shape.transform(gears.shape.rounded_rect(cr, w, h))
--     : rotate(math.pi/2)
--     : translate(10, 20)
--     return gz
-- return gears.shape.transform(gears.shape.arrow) : rotate_at(35,35,math.pi/2)(cr,70,70)
-- return gears.shape.transform(gears.shape.arrow) : rotate_at(35,35,math.pi/2)(cr,70,70)

-- gears.shape.rounded_rect(cr, 70, 70, 10)
-- gears.shape.rounded_rect(cr,20,70, 5)
-- gears.shape.transform(gears.shape.rounded_rect) : translate(0,25) (cr,70,20, 5)

-- return gears.shape.transform(gears.shape.rounded_rect) : rotate_at(4,5,2)(cr,w,4)
-- return gears.shape.transform(gears.shape.rounded_rect) : translate(w, h)
-- gears.shape.rounded_rect(cr, w, 4, 0)
-- gears.shape.rounded_rect(cr, w, 4)
-- end

-- theme.tasklist_shape_focus = function(c, w, h) return gears.shape.rounded_rect(c, w, 4) end -- cr:fill()

theme.bg_systray = theme.bg_normal
theme.systray_icon_spacing = 0
theme.snap_shape = gears.shape.rounded_rect
theme.snap_bg = theme.green_d
-- theme.snap_default_distance          = 100
theme.snap_border_width = 20
theme.menu_border_width = 16
theme.border_width = 16

theme.snapper_gap = 10
theme.useless_gap = 8

-- theme.border_width  = dpi(8)
-- theme.border_width  = dpi(8)

-- theme.border_normal = pl.term_bg

-- beautiful.snap_bg	The snap outline background color.
-- beautiful.snap_border_width	The snap outline width.
-- beautiful.snap_shape	The snap outline shape.
-- beautiful.snapper_gap	The gap between snapped contents.

theme.border_ontop = xc.wbg
theme.border_fixed = xc.c03
theme.border_urgent = xc.c01
theme.border_immobilize = xc.c03
theme.border_marked = xc.c05

theme.border_normal = xc.sk2
theme.border_focus = xc.sk3
-- theme.border_focus      = xc.sk4
-- theme.border_focus      = xc.sk4
-- theme.menu_border_color = theme.border_focus
theme.menu_border_color = theme.border_focus

theme.hotkeys_border_color = theme.border_focus
-- theme.border_normal                  = pl.xbg_normal
-- theme.border_focus                   = pl.xshade_2_
-- theme.border_marked                  = pl.xfg_fade

theme.menu_border_width = 16
theme.menu_width = 300
theme.menu_height = 50
theme.menu_submenu_icon = theme.confdir .. "/icons/submenu.png"
theme.menu_submenu_icon_empty = theme.confdir .. "/icons/submenu_empty.png"
theme.menu_fg_normal = theme.fg_normal
theme.menu_fg_focus = theme.fg_focus
theme.menu_bg_normal = theme.bg_normal
theme.menu_bg_focus = theme.bg_focus

-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
theme.taglist_fg_empty = theme.fg_fade -- theme.fg_minimize -- "#1A2226" -- 1A2226  "#515F66"
theme.taglist_bg_empty = xc.background
theme.taglist_fg_occupied = xc.sbg
theme.taglist_bg_occupied = xc.sk1
theme.taglist_bg_single = theme.yellow_d
theme.taglist_fg_single = xc.color1
-- theme.taglist_bg_urgent   = theme.bg_normal
theme.taglist_fg_urgent = xc.ebg
theme.taglist_bg_urgent = theme.bg_focus
theme.taglist_bg_focus = theme.bg_focus
theme.taglist_fg_focus = xc.wbg -- theme.blue_d
theme.taglist_bg_volatile = theme.bg_focus
theme.taglist_fg_volatile = theme.yellow_d

theme.taglist_spacing = 4
theme.taglist_squares_resize = true
-- theme.taglist_shape_border_width   = 34
-- theme.taglist_shape_border_width_focus   = 34

theme.progressbar_width = 26
theme.progressbar_bg = theme.bg_focus
theme.progressbar_fg = theme.blue_l
theme.tooltip_bg = theme.bg_normal
theme.tooltip_fg = theme.fg_normal

theme.notification_margin = 0
theme.notification_border_width = 0
-- znotification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]
-- notification_icon_size = 32
--

theme.tasklist_spacing = 8
theme.tasklist_plain_task_name = false
theme.tasklist_disable_icon = true
theme.tasklist_align = "center"
theme.tasklist_sticky = " ﴻ "
theme.tasklist_above = " "
theme.tasklist_ontop = " " --
theme.tasklist_below = " "
-- theme.tasklist_floating             = "卑 "
theme.tasklist_floating = " "
-- theme.tasklist_floating          = " "
theme.tasklist_maximized = " "
theme.tasklist_maximized_horizontal = " " -- 聾
theme.tasklist_maximized_vertical = " " -- 祉 祈
theme.mico_msearch = "🜂"
--   ﭥ ﭦ ﭰ          
-- ⯅ ⯆ ⯇ 🜂 🜄   ⛬ ⛬ ⭘    廓   遲ﳟ      遲 ﳟ 
--                      
--                  
--    ▁  ▎ ▍          
--
-- theme.tasklist_minimized             = "神 "
-- theme.tasklist_maximized             = "ﰂ " --  ﰂ       樂洛烙

theme.widget_temp = theme.confdir .. "/icons/temp.png"
theme.widget_uptime = theme.confdir .. "/icons/ac.png"
theme.widget_cpu = theme.confdir .. "/icons/cpu.png"
theme.widget_weather = theme.confdir .. "/icons/dish.png"
theme.widget_fs = theme.confdir .. "/icons/fs.png"
theme.widget_mem = theme.confdir .. "/icons/mem.png"
theme.widget_fs = theme.confdir .. "/icons/fs.png"
theme.widget_note = theme.confdir .. "/icons/note.png"
theme.widget_note_on = theme.confdir .. "/icons/note_on.png"
theme.widget_netdown = theme.confdir .. "/icons/net_down.png"
theme.widget_netup = theme.confdir .. "/icons/net_up.png"
theme.widget_mail = theme.confdir .. "/icons/mail.png"
theme.widget_batt = theme.confdir .. "/icons/bat.png"
theme.widget_clock = theme.confdir .. "/icons/clock.png"
theme.widget_vol = theme.confdir .. "/icons/spkr.png"
theme.no_1 = theme.confdir .. "/icons/apps/no_1.png"
theme.no_2 = theme.confdir .. "/icons/apps/no_2.png"
theme.no_3 = theme.confdir .. "/icons/apps/no_3.png"
theme.no_4 = theme.confdir .. "/icons/apps/no_4.png"
theme.ticket_icon = theme.confdir .. "/icons/apps/ticket.png"
theme.rtorrent_icon = theme.confdir .. "/icons/apps/rtorrent.png"
theme.media_icon = theme.confdir .. "/icons/apps/media.png"
theme.etc_icon = theme.confdir .. "/icons/apps/etc.png"
theme.webstorm_icon = theme.confdir .. "/icons/apps/WebStorm.png"
theme.atom_icon = theme.confdir .. "/icons/apps/atom.png"
theme.atomx_icon = theme.confdir .. "/icons/apps/atomx.png"
theme.steam_icon = theme.confdir .. "/icons/apps/Steam.png"
theme.hexchat_icon = theme.confdir .. "/icons/apps/hexchat.png"
theme.spotify_icon = theme.confdir .. "/icons/apps/Spotify.png"
theme.chromium_icon = theme.confdir .. "/icons/apps/Chromium.png"
theme.browser_icon = theme.confdir .. "/icons/apps/browser.png"
theme.git_icon = theme.confdir .. "/icons/apps/git.png"
theme.moc_icon = theme.confdir .. "/icons/apps/moc.png"
theme.download_icon = theme.confdir .. "/icons/apps/download.png"
theme.fm_icon = theme.confdir .. "/icons/apps/fm.png"
theme.audio_icon = theme.confdir .. "/icons/apps/audio.png"
theme.slack_icon = theme.confdir .. "/icons/apps/slack.png"
theme.whatsapp_icon = theme.confdir .. "/icons/apps/whatsapp.png"
theme.telegram_icon = theme.confdir .. "/icons/apps/telegram.png"

theme.netflix_icon = theme.confdir .. "/icons/apps/netflix.png"
theme.youtube_icon = theme.confdir .. "/icons/apps/youtube.png"
theme.soundcloud_icon = theme.confdir .. "/icons/apps/soundcloud.png"
theme.files_icon = theme.confdir .. "/icons/apps/files.png"
theme.mtx_icon = theme.confdir .. "/icons/apps/mtx.png"
theme.trm_icon = theme.confdir .. "/icons/apps/trm.png"
theme.web_icon = theme.confdir .. "/icons/apps/web.png"
-- theme.lain_icons   = os.getenv("HOME") .. "/.config/awesome/lain/icons/layout/mzenburn/"

local layout_icons = theme.confdir .. "/icons/layout/"
local l2_icons = layout_icons -- theme.confdir .. "/icons/l2/"
local l3_icons = layout_icons -- theme.confdir .. "/icons/l3/"

theme.layout_floating = l3_icons .. "floating.png"
theme.layout_tile = l3_icons .. "tile.png"
theme.layout_tileleft = l3_icons .. "tileleft.png"
theme.layout_tilebottom = l3_icons .. "tilebottom.png"
theme.layout_tiletop = l3_icons .. "tiletop.png"

theme.layout_termfair = l3_icons .. "fair.png"
theme.layout_centerfair = l3_icons .. "fair.png" -- termfair.center
theme.layout_fair = l3_icons .. "fair.png"
theme.layout_fairv = l3_icons .. "fair.png"
theme.layout_fairh = l3_icons .. "fairh.png"

theme.layout_cascade = l3_icons .. "spiral.png"
-- theme.layout_centerwork  = l3_icons .. "spiral.png"
-- theme.layout_centerworkh = l3_icons .. "spiral_d.png" -- centerwork.horizontal

theme.layout_cascadetile = l2_icons .. "cascadetile.png" -- cascade.tile
theme.layout_max = l3_icons .. "max.png"

theme.layout_tilegaps = l2_icons .. "tilegaps.png"
-- theme.layout_spiral      = l2_icons .. "spiral.png"
-- theme.layout_dwindle     = l2_icons .. "dwindle.png"

-- theme.layout_fullscreen  = l2_icons .. "fullscreen.png"
theme.layout_magnifier = l2_icons .. "magnifier.png"
-- theme.layout_cornernw    = l2_icons .. "cornernw.png"
-- theme.layout_cornerne    = l2_icons .. "cornerne.png"
theme.layout_cornersw = l3_icons .. "corner.png"
-- theme.layout_cornersw    = l2_icons .. "tile.png"
-- theme.layout_cornerse    = l2_icons .. "cornerse.png"

-- theme.titlebar_close_button_normal              = theme.confdir .. "/icons/titlebar/close_normal.png"
-- theme.titlebar_close_button_focus               = theme.confdir .. "/icons/titlebar/close_focus.png"
-- theme.titlebar_minimize_button_normal           = theme.confdir .. "/icons/titlebar/minimize_normal.png"
-- theme.titlebar_minimize_button_focus            = theme.confdir .. "/icons/titlebar/minimize_focus.png"
-- theme.titlebar_ontop_button_normal_inactive     = theme.confdir .. "/icons/titlebar/ontop_normal_inactive.png"
-- theme.titlebar_ontop_button_focus_inactive      = theme.confdir .. "/icons/titlebar/ontop_focus_inactive.png"
-- theme.titlebar_ontop_button_normal_active       = theme.confdir .. "/icons/titlebar/ontop_normal_active.png"
-- theme.titlebar_ontop_button_focus_active        = theme.confdir .. "/icons/titlebar/ontop_focus_active.png"
-- theme.titlebar_sticky_button_normal_inactive    = theme.confdir .. "/icons/titlebar/sticky_normal_inactive.png"
-- theme.titlebar_sticky_button_focus_inactive     = theme.confdir .. "/icons/titlebar/sticky_focus_inactive.png"
-- theme.titlebar_sticky_button_normal_active      = theme.confdir .. "/icons/titlebar/sticky_normal_active.png"
-- theme.titlebar_sticky_button_focus_active       = theme.confdir .. "/icons/titlebar/sticky_focus_active.png"
-- theme.titlebar_floating_button_normal_inactive  = theme.confdir .. "/icons/titlebar/floating_normal_inactive.png"
-- theme.titlebar_floating_button_focus_inactive   = theme.confdir .. "/icons/titlebar/floating_focus_inactive.png"
-- theme.titlebar_floating_button_normal_active    = theme.confdir .. "/icons/titlebar/floating_normal_active.png"
-- theme.titlebar_floating_button_focus_active     = theme.confdir .. "/icons/titlebar/floating_focus_active.png"
-- theme.titlebar_maximized_button_normal_inactive = theme.confdir .. "/icons/titlebar/maximized_normal_inactive.png"
-- theme.titlebar_maximized_button_focus_inactive  = theme.confdir .. "/icons/titlebar/maximized_focus_inactive.png"
-- theme.titlebar_maximized_button_normal_active   = theme.confdir .. "/icons/titlebar/maximized_normal_active.png"
-- theme.titlebar_maximized_button_focus_active    = theme.confdir .. "/icons/titlebar/maximized_focus_active.png"
-- -------------------------------------------------------------------------- --
-- theme.font          = "sans 8"
-- theme.confdir       = os.getenv("HOME") .. "/.config/awesome/themes/default"
-- theme.wallpaper     = theme.confdir .. "/wall.png"
-- theme.bg_normal     = "#222222"
-- theme.bg_focus      = "#535d6c"
-- theme.bg_urgent     = "#ff0000"

-- theme.fg_normal     = "#aaaaaa"
-- theme.fg_focus      = "#ffffff"
-- theme.fg_urgent     = "#ffffff"
-- theme.fg_minimize   = "#ffffff"

-- theme.useless_gap   = dpi(0)
-- theme.border_normal = "#000000"
-- theme.border_focus  = "#535d6c"
-- theme.border_marked = "#91231c"

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- - prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]

-- theme.prompt_fg_cursor = xc.wbg
theme.prompt_bg_cursor = xc.wk3
theme.prompt_fg = xc.ebg
theme.prompt_bg = xc.wk2

-- Generate taglist squares:
-- local taglist_square_size = dpi(9)
-- theme.taglist_squares_sel = theme_assets.taglist_squares_sel( taglist_square_size, theme.fg_normal )
-- theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
--     taglist_square_size, theme.fg_normal
-- )

-- Variables set for theming notifications:
-- zznotification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
-- theme.menu_submenu_icon = themes_path.."default/submenu.png"
-- theme.menu_height = dpi(15)
-- theme.menu_width  = dpi(100)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"
-- theme.notification_icon_size = 32
-- theme.notification_margin = 32

-- Define the image to load
theme.titlebar_close_button_normal = themes_path .. "default/titlebar/close_normal.png"
theme.titlebar_close_button_focus = themes_path .. "default/titlebar/close_focus.png"

theme.titlebar_minimize_button_normal = themes_path .. "default/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus = themes_path .. "default/titlebar/minimize_focus.png"

theme.titlebar_ontop_button_normal_inactive = themes_path .. "default/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive = themes_path .. "default/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = themes_path .. "default/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active = themes_path .. "default/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = themes_path .. "default/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive = themes_path .. "default/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = themes_path .. "default/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active = themes_path .. "default/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = themes_path .. "default/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive = themes_path .. "default/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = themes_path .. "default/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active = themes_path .. "default/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = themes_path .. "default/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive = themes_path .. "default/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = themes_path .. "default/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active = themes_path .. "default/titlebar/maximized_focus_active.png"

-- theme.wallpaper = themes_path.."default/background.png"

-- You can use your own layout icons like this:
-- theme.layout_fairh = themes_path.."default/layouts/fairhw.png"
-- theme.layout_fairv = themes_path.."default/layouts/fairvw.png"
-- theme.layout_floating  = themes_path.."default/layouts/floatingw.png"
-- theme.layout_magnifier = themes_path.."default/layouts/magnifierw.png"
-- theme.layout_max = themes_path.."default/layouts/maxw.png"
-- theme.layout_fullscreen = themes_path.."default/layouts/fullscreenw.png"
-- theme.layout_tilebottom = themes_path.."default/layouts/tilebottomw.png"
-- theme.layout_tileleft   = themes_path.."default/layouts/tileleftw.png"
-- theme.layout_tile = themes_path.."default/layouts/tilew.png"
-- theme.layout_tiletop = themes_path.."default/layouts/tiletopw.png"
-- theme.layout_spiral  = themes_path.."default/layouts/spiralw.png"
-- theme.layout_dwindle = themes_path.."default/layouts/dwindlew.png"
-- theme.layout_cornernw = themes_path.."default/layouts/cornernww.png"
-- theme.layout_cornerne = themes_path.."default/layouts/cornernew.png"
-- theme.layout_cornersw = themes_path.."default/layouts/cornersww.png"
-- theme.layout_cornerse = themes_path.."default/layouts/cornersew.png"

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(theme.menu_height, theme.bg_focus, theme.fg_urgent)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
-- theme.icon_theme = nil

-- For tabbed only
theme.tabbed_spawn_in_tab = false -- whether a new client should spawn into the focused tabbing container

-- For tabbar in general
theme.tabbar_ontop = false
theme.tabbar_radius = 0 -- border radius of the tabbar
theme.tabbar_style = "default" -- style of the tabbar ("default", "boxes" or "modern")
theme.tabbar_font = font_normal -- font of the tabbar
theme.tabbar_size = 24 -- size of the tabbar
theme.tabbar_position = "bottom" -- position of the tabbar
theme.tabbar_bg_normal = xc.c00
theme.tabbar_fg_normal = xc.c08
theme.tabbar_bg_focus = xc.wbg
theme.tabbar_fg_focus = xc.wfg

-- the following variables are currently only for the "modern" tabbar style
theme.tabbar_color_close = xc.sbg -- chnges the color of the close button
theme.tabbar_color_min = xc.wbg -- chnges the color of the minimize button
theme.tabbar_color_float = xc.ebg -- chnges the color of the float button

return theme

-- local gdebug = require("gears.debug")
-- local _dpt = function(_data,_tag) gdebug.print_warning(gdebug.dump_return(_data, string.upper(_tag), 10)) end
-- _dpt({
--     dp16=dpi(16),
--     dp8=dpi(8),
--     dp4=dpi(4),
--     dp2=dpi(2),
--     dp1=dpi(1),
--     dp0=dpi(0),
-- },'__MXDPI__<<<<<<<<<<<<<<<<<<<#####################')
-- math.floor                           ( fs*1.1) -- 16 => 17)

-- #2980b9

-- old ➘ ➘ ➘
-- pl.xfg_normal  = "#5f5f87" -- fg base
-- pl.xbg_normal  = "#1a1b26" -- bg base
-- pl.xbg_actv    = "#171821" -- bg actv
-- pl.xfg_fade   = "#2e3440" -- "#5f5f87" -- taglist_fg_empty
--      🡼 🡼 🡼 🡼

-- pl.xbg_actv    = "#191920" --  #191920 ct $(ct 5F5FD7 s -60% ) v -85%
-- pl.xbg_actv    = "#171720" --  #171720 ct $(ct 5F5FD7 s -50% ) v -85%
-- pl.xbg_actv    = "#292935" -- #292935 ct $(ct 5F5FD7 s -60% ) v -75%
-- pl.xbg_actv    = "#21212a" -- #21212a ct $(ct 5F5FD7 s -60% ) v -80%
-- pl.xfg_focus   = pl.xmain_1 -- fg actv
-- pl.xfg_fade   = "#1f202d" -- taglist_fg_empty
-- pl.xfg_normal  = "#495e7a" -- fg base
-- pl.xbg_normal  = "#1e1f32" -- p10 - tmx
-- pl.xbg_normal  = "#1e1e2a" --  #1e1e2a ct $(ct 5F5FD7 s -50% ) v -80%
-- pl.xbg_normal  = "#1c1c2a" -- 🚩  #1c1c2a ct $(ct 5F5FD7 s -40% ) v -80%

-- CURR >
-- pl.xfg_normal  = "#4e4e81" -- fg base
-- pl.xbg_normal  = "#1c1c2a" --  #1c1c2a ct $(ct 5F5FD7 s -40% ) v -80%
-- pl.xbg_actv    = "#161620" --  #161620  ct $(ct 5F5FD7 s -45% ) v -85%
-- pl.xfg_focus   = theme.blue_l
-- CURR <
-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80

-- theme.tasklist_shape_border_color    = xc.color5
-- theme.tasklist_shape_border_width    = 4
-- theme.tasklist_bg_focus                 = xc.wbg
-- theme.tasklist_fg_focus                 = xc.wbg

-- theme.tasklist_bg_focus                 = xc.color0
-- theme.tasklist_fg_focus                 = xc.wbg

-- theme.tasklist_fg_focus                 = pl.xfg_focus
-- theme.tasklist_shape_border_color_focus = pl.xfg_focus
-- theme.tasklist_shape_border_width_focus = 1
-- theme.tasklist_shape = gears.shape.rounded_rect
--
--
