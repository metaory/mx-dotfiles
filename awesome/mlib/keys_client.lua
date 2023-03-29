local gears = require("gears")
local awful = require("awful")
local lain = require("lain")
local thm = require("beautiful")

-- ,

local altkey = "Mod1"
local modkey = "Mod4"
local ctrlky = "Control"
local shiftk = "Shift"
local rel_cmove = function(x,y,w,h) return function(c) 
  -- c.size_hints_honor = false
  c:relative_move(x or 0, y or 0, w or 0, h or 0) 
end end

-- local bling = require("bling")
local clientkeys = gears.table.join(
  -- i y a d g v b 
  -- awful.key({ modkey }, "a" , function (c) bling.module.tabbed.pick() end),
  -- awful.key({ modkey }, "d" , function (c) bling.module.tabbed.pop() end),
  -- awful.key({ modkey }, "b" , function (c) bling.module.tabbed.iter() end),
  -- awful.key({ modkey }, "y" , function (c) bling.module.tabbed.pick_with_dmenu() end),

    -- picks a client with a dmenu application (defaults to rofi, other options can be set with a string parameter like "dmenu")


  awful.key({ modkey, altkey }, "j" ,  rel_cmove(  0,  20,   0,   0)),
  awful.key({ modkey, altkey }, "k" ,  rel_cmove(  0, -20,   0,   0)),
  awful.key({ modkey, altkey }, "h" ,  rel_cmove(-20,   0,   0,   0)),
  awful.key({ modkey, altkey }, "l" ,  rel_cmove( 20,   0,   0,   0)),
  --
  awful.key({ modkey , ctrlky , altkey } , "j" , rel_cmove(0   , 10  , 0   , -20)) ,
  awful.key({ modkey , ctrlky , altkey } , "k" , rel_cmove(0   , -10 , 0   , 20 )) ,
  awful.key({ modkey , ctrlky , altkey } , "h" , rel_cmove(10  , 0   , -20 , 0  )) ,
  awful.key({ modkey , ctrlky , altkey } , "l" , rel_cmove(-10 , 0   , 20  , 0  )) ,

  -- awful.key({ modkey, altkey }    , "j"   , function (c) c:relative_move(  0,  20,   0,   0) end),
  -- awful.key({ modkey, altkey }    , "k"   , function (c) c:relative_move(  0, -20,   0,   0) end),
  -- awful.key({ modkey, altkey }    , "h"   , function (c) c:relative_move(-20,   0,   0,   0) end),
  -- awful.key({ modkey, altkey }    , "l"   , function (c) c:relative_move( 20,   0,   0,   0) end),
  awful.key({ modkey, shiftk }, "Tab", function (c) awful.client.focus.history.previous() c:swap(awful.client.getmaster()) end, {description = "go back", group = "client"}),

 awful.key( { modkey, altkey         } , "Return", function (c) c:swap(awful.client.getmaster()) end,       { description = "move to master", group = "client"    } )
,
  awful.key({ modkey, }, "q", function (c) c:kill() end, {description = "close", group = "client"}),
  awful.key({ modkey, }, "o", function (c) c:move_to_screen() end, {description = "move to screen", group = "client"}),
  -- awful.key({ modkey, }, "t", function (c) c.ontop = not c.ontop end, {description = "toggle keep on top", group = "client"}),
  awful.key({ modkey, }, "t", function (c) 
    c.ontop = not c.ontop
    if not c.ontop then 
      awful.client.focus.history.previous()
      if client.focus then client.focus:raise() end 
    end
  end, {description = "toggle keep on top", group = "client"}),
  awful.key({ modkey, }, "n", function (c) c.minimized = true end, {description = "minimize", group = "client"}),
  awful.key({ modkey, }, "m", function (c) c.maximized = not c.maximized c:raise() end, {description = "(un)maximize", group = "client"}),
  -- awful.key({ modkey, }, "m", function (c)
  --   if not c.maximized then c.border_width = 0 end
  --   c.maximized = not c.maximized
  --   c:raise()
  -- end, {description = "(un)maximize", group = "client"}),

  awful.key( { modkey, ctrlky          } , "m", function (c) c.maximized_vertical   = not c.maximized_vertical c:raise() end,   { description = "(un)maximize vertically", group   = "client" } ),
  awful.key( { modkey, shiftk            } , "m", function (c) c.maximized_horizontal = not c.maximized_horizontal c:raise() end, { description = "(un)maximize horizontally", group = "client" } ),
  awful.key( { modkey, ctrlky, shiftk } , "m", function (c)
    client.connect_signal('mouse::enter', mousefocus_sg)
  end,  {description = "(un)mouse:enter signal", group = "client"}),

  awful.key( { modkey, ctrlky, shiftk } , "n", function (c)
    client.disconnect_signal('mouse::enter', mousefocus_sg)
  end,  {description = "(un)mouse:enter dis_signal", group = "client"}),

  awful.key({ modkey, ctrlky, shiftk }, "b",
    function (c)
      c.size_hints_honor = not c.size_hints_honor
    end, {description = "set size_hints_honor true", group = "client"}),

  awful.key({ modkey, shiftk }, "b",
    function (c)
      local t = awful.screen.focused().selected_tag
      if not t then return end
      local clients = t:clients()
      for _, c in ipairs(clients) do
        if c.border_width == 0 then
          c.border_width = thm.border_width
        else
          c.border_width = 0
        end
      end
    end, {description = "toggle border of all active tag clients", group = "tag"}),

  awful.key({ modkey, ctrlky }, "b", 
    function (c) c.border_width = c.border_width == 0 and thm.border_width or 0 end
    ,{description = "toggle active client border", group = "client"}),

awful.key({ modkey, altkey }, "z", function (c) 
    c.maximized            = false
    c.maximized_vertical   = false
    c.maximized_horizontal = false
    lain.util.magnify_client(c) 
  end, {description = "magnify", group = "client"}),
  --
  awful.key({ modkey }, "z", function (c) 
    local s                = awful.screen.focused() --[[ c.y = c.screen.geometry.height - 558 c.width = c.screen.geometry.width ]]
    local sw               = s.workarea
    local g                = {}

    -- if not c.floating         then c.floating             = true  end
    -- c.floating = not c.floating
    if awful.layout.getname() ~= 'floating' then
      if not c.floating then c.floating = true end
    end

    if c.maximized_horizontal then c.maximized_horizontal = false end
    if c.maximized_vertical   then c.maximized_vertical   = false end
    if c.maximized            then c.maximized            = false end

    g.width                = math.sqrt(0.7) * sw.width
    g.height               = math.sqrt(0.7) * sw.height 
    g.x                    = sw.x + (sw.width - g.width) / 2
    g.y                    = sw.y + (sw.height - g.height) / 6
  if c then c:geometry(g) c:raise() end
  end, {description = "magnify", group = "client"}),

awful.key({ modkey, shiftk }, "z", function (c)
  local s                = awful.screen.focused() --[[ c.y = c.screen.geometry.height - 558 c.width = c.screen.geometry.width ]]
  local sw               = s.workarea
  local g                = {}
  c.floating             = not c.floating
  c.maximized            = false
  c.maximized_vertical   = false
  c.maximized_horizontal = false
  g.width                = math.sqrt(0.6) * sw.width
  g.height               = math.sqrt(0.35) * sw.height 
  g.x                    = sw.x + (sw.width - g.width) / 2
  g.y                    = sw.y + (sw.height - g.height) / 6
  if c then c:geometry(g) c:raise() end
end, {description = "center top", group = "client"}),

awful.key({ modkey , }        , "f" , function (c) c.fullscreen = not c.fullscreen c:raise() end , {description = "toggle fullscreen" , group   = "client" } ),
awful.key({ modkey , shiftk } , "f" , function (c) c.floating   = not c.floating   c:raise() end , {description = "toggle fullscreen"   , group = "client" } )
)
return clientkeys
