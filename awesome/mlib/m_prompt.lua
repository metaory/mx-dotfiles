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
-- local mtheme = require('mtheme')
local thm = require("beautiful")

local m_prompt = awful.widget.prompt()

local w = wibox({
	bg = thm.bg_focus,
	border_width = 20,
	border_color = thm.border_focus,
	-- opacity = 0.2,
	ontop = true,
	-- height = 36,
	-- width = 500,
	-- max_widget_size = 500,
	height = 80,
	width = 1000,
	max_widget_size = 1000,
	shape = function(cr, width, height)
		gears.shape.rounded_rect(cr, width, height, 4)
	end,
})

w:setup({
	{
		layout = wibox.container.margin,
		left = 0,
		bottom = 0,
		top = 0,
		-- opacity = 0.5,
		m_prompt,
	},
	id = "left",
	layout = wibox.layout.fixed.horizontal,
})

local function launch(key)
	w.visible = true
	awful.placement.top(w, { margins = { top = 120 }, parent = awful.screen.focused() })
	awful.prompt.run({
		prompt = "<span size='x-large' background='"
			.. thm.wbg
			.. "' color='#000000'> "
			.. "樂 RUN"
			.. " </span><span size='x-large' stretch='ultraexpanded' color='"
			.. thm.wbg
			.. "'></span> ",
		-- opacity = 0.2,
		bg = thm.accent,
		fg = thm.accent,
		font = "SauceCodePro Nerd Font Mono Bold 22",
		fg_cursor = thm.wbg,
		bg_cursor = thm.wbg,
		textbox = m_prompt.widget,
		history_path = gfs.get_dir("cache") .. "/mprompt_history",
		history_max = 100,
		exe_callback = function(input_text)
			if not input_text or #input_text == 0 then
				return
			end
			awful.spawn(input_text)
		end,
		done_callback = function()
			w.visible = false
		end,
	})
end

return { launch = launch }
