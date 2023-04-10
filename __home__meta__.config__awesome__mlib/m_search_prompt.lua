-------------------------------------------------
-- Meta Prompt
-- https://github.com/metaory/mawm/tree/master/mprompt

-- @author Metaory
-- @copyright 2021 Meta
-------------------------------------------------

local awful = require("awful")
local gfs = require("gears.filesystem")
local wibox = require("wibox")
local gears = require("gears")
-- local beautiful = require("beautiful")
-- local m = require("/home/metaory/.config/awesome/theme.lua")
local mtheme = require("mtheme")
local thm = require("beautiful")
-- /home/metaory/.config/awesome/mtheme.lua
-- local mtheme = require("/home/metaory/.config/awesome/themes/metaory/theme.lua")
-- beautiful.init("/home/metaory/.config/awesome/themes/metaory/theme.lua")

-- local ICON = '/home/metaory/.config/awesome/themes/metaory/icons/apps/Chromium.png'

local m_shell = awful.widget.prompt()

local xresources = require("beautiful.xresources")
local xc = xresources.get_current_theme()

local w = wibox({
	border_width = 20,
	border_color = thm.border_focus,
	-- opacity = 0.2,
	ontop = true,
	-- height = 36,
	-- width = 500,
	-- max_widget_size = 500,
	height = 80,
	-- y = 300,
	width = awful.screen.focused().workarea.width - 600,
	max_widget_size = 1000,
	shape = function(cr, width, height)
		gears.shape.rounded_rect(cr, width, height, 4)
	end,
})

w:setup({
	-- {
	--     {
	--
	-- -- markup = 'This <i>is</i> a <b>textbox</b>!!!',
	-- -- align  = 'center',
	-- -- valign = 'center',
	--       text   = mtheme.search.ico,
	--       widget = wibox.widget.textbox,
	--
	--       -- image = mtheme.search.ico_img,
	--       -- widget = wibox.widget.imagebox,
	--       -- resize = false
	--     },
	--     id = 'icon',
	--     top = 0,
	--     left = 10,
	--     layout = wibox.container.margin
	-- },
	{
		layout = wibox.container.margin,
		left = 0,
		bottom = 0,
		top = 0,
		-- opacity = 0.5,
		m_shell,
	},
	id = "left",
	layout = wibox.layout.fixed.horizontal,
})

-- ⯅ ⯆ ⯇ 🜂  🜄 ⛬ ⛬ ⭘    廓   遲ﳟ      遲 ﳟ 
-- mytextclock = wibox.widget.textclock(" <small>%a %b %d</small> <span color='"..beautiful.prpl_l.."'>%H:%M</span>")
-- mytextclock = wibox.widget.textclock("<small><i>%a %b %d</i></small> <span color='"..beautiful.prpl_l.."'>%H</span><small>:</small><span color='"..beautiful.prpl_l.."'>%M</span>")
-- mytextclock = wibox.widget.textclock("<span size='small' stretch='ultracondensed'>%a.%b.%d</span> <span color='"..beautiful.prpl_l.."'>%H</span><small>:</small><span color='"..beautiful.prpl_l.."'>%M</span>")
--
-- local mico='zz'
-- local m = {
-- ico='::',
-- col="#5F5FD7"
-- }
-- local phead = "<span size='larger' color='"..beautiful.prpl_l.."'>"..beautiful.mico_msearch.."</span>"

-- # Arch Linux
-- a: https://www.google.com/search?q=arch+linux+%s&btnI
-- ap: https://www.archlinux.org/packages/?q=%s
-- au: https://aur.archlinux.org/packages/?O=0&K=%s
-- af: https://www.google.com/search?q=site:https:%2F%2Fbbs.archlinux.org+%s
--
-- nm: https://unbug.github.io/codelf/#%s
-- git: https://github.com/search?q=%s&ref=opensearch
-- npm: https://www.npmjs.org/search?q=%s
-- # Steam
-- st: http://store.steampowered.com/search/?ref=os&term=%s&os=linux
-- # Wikipedia
-- w: https://www.wikipedia.org/w/index.php?title=Special:Search&search=%s Wikipedia

-- local mquery = mtheme.search.query
-- local phead = "<span size='larger' color='"..mtheme.search.col.."'>"..mtheme.search.ico.."</span>  "
local function launch(key)
	w.visible = true
	awful.placement.top(
		w,
		{ margins = { top = awful.screen.focused().workarea.height * 0.5 }, parent = awful.screen.focused() }
	)
	--   bg1 = colors.bg1,
	--   bg2 = colors.xprpl,
	--   col = '#000000',
	--
	local item = mtheme.search[key]
	awful.prompt.run({
		prompt = "<span size='x-large' background='"
			.. thm.wbg
			.. "' color='#000000'> "
			.. item.ico
			.. " "
			.. string.upper(item.label)
			.. " </span><span size='x-large' stretch='ultraexpanded' color='"
			.. thm.wbg
			.. "'></span> ",
		-- opacity = 0.2,
		-- fg = thm.bg_focus,
		-- bg = thm.bg_focus,

		-- fg_cursor = thm.bg_focus,
		-- bg_cursor = thm.bg_focus,
		-- ul_cursor = thm.bg_focus,
		-- fg = thm.bg_focus,
		-- bg = thm.bg_focus,

		-- bg = thm.ebg,
		-- fg = thm.ebg,
		font = "SauceCodePro Nerd Font Mono Bold 22",
		-- fg_cursor = thm.wbg,
		-- bg_cursor = thm.wbg,
		textbox = m_shell.widget,
		history_path = gfs.get_dir("cache") .. "/msearch_history",
		history_max = 100,
		exe_callback = function(input_text)
			if not input_text or #input_text == 0 then
				return
			end
			awful.spawn(string.format("chromium --app=" .. item.query, input_text:gsub(" ", "+")))
			-- string.format("chromium --app=https://www.google.com/search?q=site:https:%2F%2Fawesomewm.org+%s", input_text)
		end,
		done_callback = function()
			w.visible = false
		end,
	})
end

return { launch = launch }

-- aww: https://www.google.com/search?q=awesomewm+lua+api+%s&btnI
-- awx: https://www.google.com/search?q=site:https:%2F%2Fawesomewm.org%2Fapidoc+%s&btnI

-- a: https://www.google.com/search?q=arch+linux+%s&btnI
-- ap: https://www.archlinux.org/packages/?q=%s
-- au: https://aur.archlinux.org/packages/?O=0&K=%s
-- af: https://www.google.com/search?q=site:https:%2F%2Fbbs.archlinux.org+%s
