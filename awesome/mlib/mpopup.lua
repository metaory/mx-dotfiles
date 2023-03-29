local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local thm = require("beautiful")

    -- local layout_popup = awful.popup {
        -- widget = wibox.widget {
            -- ll,
            -- margins = 4,
            -- widget  = wibox.container.margin,
        -- },
        -- border_color = thm.border_color,
        -- border_width = thm.border_width,
        -- placement    = awful.placement.centered,
        -- ontop        = true,
        -- visible      = false,
        -- shape        = gears.shape.rounded_rect
      -- }

-- awful.popup {
--   widget = awful.widget.layoutlist {
--     screen      = 1,
--     base_layout = wibox.layout.flex.vertical
--   },
--   maximum_height = #awful.layout.layouts * 24,
--   minimum_height = #awful.layout.layouts * 24,
--   placement      = awful.placement.centered,
-- }

local filter_terminals = function(c, screen) return 
  awful.rules.match_any(c, { 
    instance = { "kitty", "Alacritty", "termite", "MTX_UNO" }, class ={ "kitty" }
  }) 
end
local filter_etc = function(c, screen) return 
  awful.rules.match_any(c, { 
      instance = { "kitty", "Alacritty", "termite", "MTX_UNO" }, class ={ "kitty" },
    -- properties = { floating = true }
  }) 
end
        
local mpop_buttons = gears.table.join(
  awful.button({ }, 1, function (c) if c == client.focus then c.minimized = true else c:emit_signal( "request::activate", "tasklist", {raise = true} ) end end)
, awful.button({ }, 3, function() awful.menu.client_list({ theme = { width = 250 } }, nil, m_filter_etc) end)
, awful.button({ }, 4, function () awful.client.focus.byidx(1) end)
, awful.button({ }, 5, function () awful.client.focus.byidx(-1) end)
)
local mpop_keys = gears.table.join(
  awful.key({ } , "Escape", function () mpoptasklist.visible = false end)
)


mpoptasklist = awful.popup {
  widget = awful.widget.tasklist {
    screen   = screen[1],
    filter   = filter_etc,
    -- filter   = awful.widget.tasklist.filter.allscreen,
    buttons  = mpop_buttons,
    keys =  mpop_keys,
    visible = false,
    style    = {
      shape = gears.shape.rounded_rect,
    },
    layout   = {
      spacing = 5,
      forced_num_rows = 2,
      layout = wibox.layout.grid.horizontal
    },
    widget_template = {
      {
        {
          id     = 'clienticon',
          widget = awful.widget.clienticon,
        },
        margins = 4,
        widget  = wibox.container.margin,
      },
      id              = 'background_role',
      forced_width    = 48,
      forced_height   = 48,
      widget          = wibox.container.background,
      create_callback = function(self, c, index, objects) --luacheck: no unused
        self:get_children_by_id('clienticon')[1].client = c
      end,
    },
  },
  border_color = '#777777',
  border_width = 2,
  ontop        = true,
  placement    = awful.placement.centered,
  shape        = gears.shape.rounded_rect
}
--     awful.keygrabber {
--         start_callback = function() layout_popup.visible = true  end,
--         stop_callback  = function() layout_popup.visible = false end,
--         export_keybindings = true,
--         release_event = 'release',
--         stop_key = {'Escape', 'Super_L', 'Super_R'},
--         keybindings = {
--             {{ } , 'j' , function()
--             awful.popup:move_next_to
--                 awful.layout.set(gears.table.iterate_value(ll.layouts, ll.current_layout, 1))
--             end},
--             {{ modkey, 'Shift' } , ' ' , function()
--                 awful.layout.set(gears.table.iterate_value(ll.layouts, ll.current_layout, -1), nil)
--             end},
--         }
--         keybindings = {
--             {{ modkey          } , ' ' , function()
--                 awful.layout.set(gears.table.iterate_value(ll.layouts, ll.current_layout, 1))
--             end},
--             {{ modkey, 'Shift' } , ' ' , function()
--                 awful.layout.set(gears.table.iterate_value(ll.layouts, ll.current_layout, -1), nil)
--             end},
--         }
--     }


-- awful.popup {
-- widget = awful.widget.tasklist {
-- screen   = screen[1],
-- filter   = awful.widget.tasklist.filter.allscreen,
-- buttons  = tasklist_buttons,
-- style    = {
-- shape = gears.shape.rounded_rect,
-- },
-- layout   = {
-- spacing = 5,
-- forced_num_rows = 2,
-- layout = wibox.layout.grid.horizontal
-- },
-- widget_template = {
-- {
-- {
-- id     = 'clienticon',
-- widget = awful.widget.clienticon,
-- },
-- margins = 4,
-- widget  = wibox.container.margin,
-- },
-- id              = 'background_role',
-- forced_width    = 48,
-- forced_height   = 48,
-- widget          = wibox.container.background,
-- create_callback = function(self, c, index, objects) --luacheck: no unused
-- self:get_children_by_id('clienticon')[1].client = c
-- end,
-- },
-- },
-- border_color = '#777777',
-- border_width = 2,
-- ontop        = true,
-- placement    = awful.placement.centered,
-- shape        = gears.shape.rounded_rect
-- }

--awful.popup:bind_to_widget (widget[, button=1])
-- local p2 = awful.popup {
-- widget = wibox.widget {
-- text   = 'A popup',
-- forced_height = 100,
-- widget = wibox.widget.textbox
-- },
-- border_color        = '#777777',
-- border_width        = 2,
-- preferred_positions = 'right',
-- preferred_anchors   = {'front', 'back'},
-- }
-- local p4 = awful.popup {
-- widget = wibox.widget {
-- text   = 'A popup2',
-- forced_height = 100,
-- widget = wibox.widget.textbox
-- },
-- border_color        = '#777777',
-- border_width        = 2,
-- preferred_positions = 'right',
-- preferred_anchors   = {'front', 'back'},
-- }
