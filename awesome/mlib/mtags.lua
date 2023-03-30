local awful = require("awful")
local gears = require("gears")
local theme = require("beautiful")

local mtags = {}
mtags.taglist_buttons = gears.table.join(
	awful.button({}, 1, function(t)
		t:view_only()
	end),
	awful.button({ modkey }, 1, function(t)
		if client.focus then
			client.focus:move_to_tag(t)
		end
	end),
	awful.button({}, 3, awful.tag.viewtoggle),
	awful.button({ modkey }, 3, function(t)
		if client.focus then
			client.focus:toggle_tag(t)
		end
	end),
	awful.button({}, 4, function(t)
		awful.tag.viewnext(t.screen)
	end),
	awful.button({}, 5, function(t)
		awful.tag.viewprev(t.screen)
	end)
)
mtags.on_screen_connect = function(s)
	-- awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])
	-- awful.tag.add("𐊾", { layout = awful.layout.suit.floating, screen = s, selected = true, }) awful.tag.add("𐋄", { layout = awful.layout.suit.floating, screen = s, }) awful.tag.add("𐠲", { layout = awful.layout.suit.floating, screen = s, }) awful.tag.add("𐠂", { layout = awful.layout.suit.floating, screen = s, }) awful.tag.add("𐊛", { layout = awful.layout.suit.floating, screen = s, }) awful.tag.add("𐋈", { layout = awful.layout.suit.floating, screen = s, }) awful.tag.add("𐊑", { layout = awful.layout.suit.floating, screen = s, }) awful.tag.add("𐋅", { layout = awful.layout.suit.floating, screen = s, }) awful.tag.add("ⵌ", { layout = awful.layout.suit.floating, screen = s, })
	-- 𐊾 𐋄 𐠲 𐠂 𐊛 𐋈 𐊑 𐋅 ⵌ
	-- ﯶ ﰩ        
	--           ﰋ ﱦ ﲯ ﲵ
	-- ﮒ  ﮸  --    
	-- 羽ﮂ 祥 ﮫ
	-- ﰩ      力
	--頋 神  臘      濫
	--   
	-- ﯶ 更         廓 神     摒 遲 ﳟ 
	--  神     摒 遲 ﳟ 
	-- ﯶ  ﰩ     ﰩ  ⛬   ﳕ ﴙ
	-- #          ﰋ ﱦ ﲯ ﲵ ﮊ 
	-- ⛛ ⛬  🞇 🙼  ░ 卑喝 ﯸ ﯹ ﯹ ﯻ ﯼ ﰩ  ▼ |    
	-- mtags.tags = {
	awful.tag.add("", --[[ 1 ]] {
		layout = awful.layout.suit.floating,
		-- width = 99,
		-- forced_width = 99,
		-- margins = 99,
		screen = s,
		selected = true,
		-- gap = 95,
		-- icon = "",
	})
	awful.tag.add("更", --[[ 2 ]] { layout = awful.layout.suit.tile.right, screen = s })
	awful.tag.add("", --[[ 3 ]] { layout = awful.layout.suit.max, screen = s })
	awful.tag.add("", --[[ 4 ]] { layout = awful.layout.suit.max, screen = s })
	awful.tag.add("", --[[ 5 ]] { layout = awful.layout.suit.cascade, screen = s })
	awful.tag.add("", --[[ 6 ]] { layout = awful.layout.suit.max, screen = s })
	awful.tag.add("", --[[ 7 ]] { layout = awful.layout.suit.fair.horizontal, screen = s })
	awful.tag.add("", --[[ 8 ]] { layout = awful.layout.suit.corner.sw, screen = s })
	awful.tag.add("", --[[ 9 ]] { layout = awful.layout.suit.max, screen = s })
	-- }
end

-- local _t = {taglist_buttons=taglist_buttons,on_screen_connect = on_screen_connect}
return mtags
-- return setmetatable(mtags, { __call = function(_, ...) return worker(...) end })
--     s.mytaglist = awful.widget.taglist {
--         screen  = s,
--         filter  = awful.widget.taglist.filter.all,
--         style   = {
--             shape = gears.shape.powerline
--         },
--         layout   = {
--             spacing = -12,
--             spacing_widget = {
--                 color  = '#dddddd',
--                 shape  = gears.shape.powerline,
--                 widget = wibox.widget.separator,
--             },
--             layout  = wibox.layout.fixed.horizontal
--         },
--         widget_template = {
--             {
--                 {
--                     {
--                         {
--                             {
--                                 id     = 'index_role',
--                                 widget = wibox.widget.textbox,
--                             },
--                             margins = 4,
--                             widget  = wibox.container.margin,
--                         },
--                         bg     = '#dddddd',
--                         shape  = gears.shape.circle,
--                         widget = wibox.container.background,
--                     },
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
--                 left  = 18,
--                 right = 18,
--                 widget = wibox.container.margin
--             },
--             id     = 'background_role',
--             widget = wibox.container.background,
--             -- Add support for hover colors and an index label
--             create_callback = function(self, c3, index, objects) --luacheck: no unused args
--                 self:get_children_by_id('index_role')[1].markup = '<b> '..index..' </b>'
--                 self:connect_signal('mouse::enter', function()
--                     if self.bg ~= '#ff0000' then
--                         self.backup     = self.bg
--                         self.has_backup = true
--                     end
--                     self.bg = '#ff0000'
--                 end)
--                 self:connect_signal('mouse::leave', function()
--                     if self.has_backup then self.bg = self.backup end
--                 end)
--             end,
--             update_callback = function(self, c3, index, objects) --luacheck: no unused args
--                 self:get_children_by_id('index_role')[1].markup = '<b> '..index..' </b>'
--             end,
--         },
--         buttons = taglist_buttons
--     }
