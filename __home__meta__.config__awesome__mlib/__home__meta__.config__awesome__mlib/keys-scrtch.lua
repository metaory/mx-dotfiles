-- client:relative_move ([x=c.x[, y=c.y[, w=c.width[, h=c.height]]]])
-- local with_client_geo = function(c)
--   c:relative_move ([x=c.x[, y=c.y[, w=c.width[, h=c.height]]]])
-- end
  -- awful.key({ "Mod1" }, "Shift_L", function() awful.screen.focused().slave_tmux:toggle() end),

  -- awful.key({ }, "KP_Right", function () awful.spawn("playerctl -p spotify next") end),
  -- awful.key({ modkey, "Shift" }, "Right", function () awful.spawn("playerctl -p spotify next") end),


  -- awful.key({ } , "KP_End"  , function () awful.spawn("amixer set Master 10%") end) , -- 1
  -- awful.key({ } , "KP_Down" , function () awful.spawn("amixer set Master 20%") end) , -- 2
  -- awful.key({ } , "KP_Next" , function () awful.spawn("amixer set Master 30%") end) , -- 3
  -- awful.key({ } , "KP_Insert", function () awful.spawn("amixer set Master 20%") end) , -- 7

  -- awful.key({ } , "KP_Home"  , function () awful.spawn("amixer set Master 20%") end) , -- 7
  -- awful.key({ } , "KP_Up"    , function () awful.spawn("amixer set Master 30%") end) , -- 8
  -- awful.key({ } , "KP_Prior" , function () awful.spawn("amixer set Master 40%") end) , -- 9

  -- awful.key({ modkey, "Shift" }, "Left", function () awful.spawn("playerctl -p spotify previous") end),
-- self.followtag
-- screen.selected_tag
  -- if self.followtag then self.screen = awful.screen.focused() end
  -- local current_tag = self.screen.selected_tag
  ----------------------------------------------------------------------------------------------------

  -- awful.key({ modkey, "Shift" }, "XF86AudioRaiseVolume", function () awful.spawn("amixer set Master 5%+") end),
  -- awful.key({ modkey, "Shift" }, "XF86AudioLowerVolume", function () awful.spawn("amixer set Master 5%-") end),

  -- awful.key({ modkey, "Shift" }, "Up", function () awful.spawn("amixer set Master 5%+") end),
  -- awful.key({ modkey, "Shift" }, "Down", function () awful.spawn("amixer set Master 5%-") end),

  -- awful.key({ modkey }, "Up", function () awful.spawn.with_shell("sudo light -A 2") end),
  -- awful.key({ modkey }, "Down", function () awful.spawn.with_shell("sudo light -U 2") end),

  -- awful.key({ }, "KP_Enter", function()
  --   awful.screen.focused().master_tmux:toggle()
  --   -- if mixer_mute then
  --   --   awful.spawn(" amixer set Master unmute")
  --   --   mixer_mute = false
  --   -- else
  --   --   awful.spawn(" amixer set Master mute")
  --   --   mixer_mute = true
  --   -- end
  -- end),
  --
  -- awful.key({ }, "KP_Subtract", function () awful.spawn("amixer set Master 2%-") end),
  -- awful.key({ }, "KP_Add", function () awful.spawn("amixer set Master 2%+") end),
  --  MON Brightness
  -- awful.key({ modkey }, "KP_Add", function () awful.spawn("sudo light -A 2") end),
  -- awful.key({ modkey }, "KP_Subtract", function () awful.spawn("sudo light -U 2") end),

  -- awful.key({ modkey }, "KP_Add", function () awful.spawn("sudo light -A 2") end),
  -- awful.key({ modkey }, "KP_Subtract", function () awful.spawn("sudo light -U 2") end),
  --  MON Brightness
  --

  ----------------------------------------------------------------------------------------------------
  -- KP_
  
  -- KP_Begin Up
  -- KP_End   Left
  -- KP_Down  Down
  -- KP_Next  Right
  -- awful.key({ }, "KP_Subtract", function () awful.spawn("amixer set Master 1%-") end),
  -- awful.key({ }, "KP_Add", function () awful.spawn("amixer set Master 1%+") end),
  ----------------------------------------------------------------------------------------------------
  -- awful.key({ }, "KP_Begin", function () awful.spawn("playerctl -p spotify play-pause") end),
  -- awful.key({ }, "KP_Left", function () awful.spawn("playerctl -p spotify previous") end),
  --
  -- ---------

  -- awful.key({ modkey, "Control", "Shift"}    , "z", with_shell(terminal .. ' -e mtx -s master slave')) ,
  -- awful.key({ modkey }    , "z"     , function() awful.screen.focused().master_tmux:toggle() end) ,
  -- awful.key({ "Mod1", "Shift" }    , "Tab"   , function() awful.screen.focused().slave_tmux:toggle() end)  ,
  -- awful.key({ "Mod1" }    , "Mod4"   , function() awful.screen.focused().slave_tmux:toggle() end)  ,
  -- awful.key({ "Mod1" }    , "Shift_L"     , function() awful.screen.focused().master_tmux:toggle() end) ,
        -- awful.key({ "Mod1" }    , "Control_L"   , function() awful.screen.focused().slave_tmux:toggle() end)  ,
  -- ---------
  -- awful.key({ }           , "Pause"       , function() awful.screen.focused().master_tmux:toggle() end) ,
  -- awful.key({ }           , "Scroll_Lock" , function() awful.screen.focused().slave_tmux:toggle()  end) ,
  -- awful.key({ modkey }    , "Scroll_Lock" , function() awful.screen.focused().master_tmux:toggle() end) ,
  -- awful.key({ modkey }    , "Pause"       , function() awful.screen.focused().slave_tmux:toggle()  end) ,
  -- awful.key({        }    , "Print"       , function() awful.screen.focused().defl_tmux:toggle() end)   ,
  -- awful.key({ }           , "KP_Insert"   , function() awful.screen.focused().defl_tmux:toggle() end)   , -- 0
  -- awful.key({ }           , "XF86Eject"   , function() awful.screen.focused().master_tmux:toggle() end) ,


-- TODO
-- awful.key({ modkey , "Control"           } , "l"       , function () awful.tag.incmwfact( 0.01) end , {description = "increase master width factor" , group = "layout"                                                                                                                     } ) ,
-- awful.key({ modkey , "Control"           } , "h"       , function () awful.tag.incmwfact(-0.01) end , {description = "decrease master width factor" , group = "layout"                                                                                                                     } ) ,

  -- TODO REMAP WHEN BACK TO DUAL SCREEN
  -- awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end, {description = "focus the next screen", group = "screen"}),
  -- awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end, {description = "focus the previous screen", group = "screen"}),
  
  -- TODO
  -- awful.key({ modkey, "Control" }, "j", function () awful.client.incwfact( 0.01, client) end , {description = "increase client width factor" , group = "client"}) ,
  -- awful.key({ modkey, "Control" }, "k", function () awful.client.incwfact(-0.01, client) end , {description = "decrease client width factor" , group = "client"}) ,
  -- awful.key({ modkey, "Shift" } , "j", function () awful.client.swap.byidx( 1) end , {description =   "swap with  next client by index" , group = "client"}) ,
  -- awful.key({ modkey, "Shift" } , "k", function () awful.client.swap.byidx( -1) end , {description =   "swap with  previous client by index" , group = "client"}) ,
  -- awful.key({ modkey, "Shift" } , "h", function () awful.tag.incnmaster(1, nil, true) end, {description = "increase the number of master   clients", group = "layout"}),
  -- awful.key({ modkey, "Shift" } , "l", function () awful.tag.incnmaster(-1, nil, true) end, {description = "decrease the number of master clients", group = "layout"}),

  -- awful.key({ }, "KP_Insert", function() awful.screen.focused().master_tmux:toggle() end), -- 0
  -- awful.key({ modkey },          "Insert",      function() awful.screen.focused().master_tmux:toggle() end),
  -- awful.key({ },                 "insert",      function() awful.screen.focused().slave_tmux:toggle()  end),
  -- awful.key({ modkey, "Shift" }, "Pause",       function() awful.spawn.with_shell("byobu -L master ls || (byobu -L master new-session -d -s 1 -n 🮠\\; rename-session ^#S; set-option -g status-position bottom))") end),
  -- awful.key({ modkey, "Shift" }, "Scroll_Lock", function() awful.spawn.with_shell("byobu -L slave ls  || (byobu -L slave  new-session -d -s 1 -n 🮠\\; rename-session ^#S; set-option -g status-position top)") end),
  -- awful.key({ modkey, "Shift" }, "Scroll_Lock", function() awful.screen.focused().master_tmux:toggle() awful.screen.focused().slave_tmux:toggle() end),
  -- awful.key({ modkey, "Shift" }, "Pause", function() awful.spawn.with_shell("bash ~/dev/meta/configs/scripts/txx/meta_tmx.sh") end),

  -- awful.key({ "Mod1" }, "Shift_L", function() awful.screen.focused().slave_tmux:toggle() end),
  -- awful.key({ "Mod1" }, "Control_L", function() awful.screen.focused().slave_tmux:toggle() end),
  -- awful.key({ "Mod1" }, "space", function() awful.screen.focused().slave_tmux:toggle() end),

-- awful.key({ "Mod1" }, "Shift_L", function () print("key 1") end),
-- awful.key({ "Shift" }, "Alt_L", function () print("key 2") end),
-- The first one is for when you press Alt first while the second one is for when Shift is pressed first (yup, this makes a difference; pressing Shift while "a" is pressed also does something else than the opposite order).

  -- awful.key({ "Control" } , "Menu"        , function() awful.screen.focused().defl_tmux:toggle() end)   ,
  -- awful.key({ "Shift" }   , "Menu"        , function() awful.screen.focused().master_tmux:toggle() end) ,

  -- awful.key({ modkey, "Shift"   } , "Return", function () awful.spawn.with_shell(debug_term) end, {description = "open termite term", group = "launcher" } ),
  -- awful.key({ modkey, "Shift"   } , "Return", function () awful.spawn(term_termite) end,   {description = "open termite term", group = "launcher" } ),
  -- awful.key({ modkey, "Shift"   } , "Return", function () awful.spawn(terminal .. ' --class=Alacritty,MTMX -e byobu -L slave new-session -n " ⛬"') end,   {description = "open nested tmx", group = "launcher" } ),
  -- awful.key({ modkey, "Shift"   },  "Pause", function() awful.spawn.with_shell("bash ~/dev/meta/configs/scripts/txx/meta_tmx.sh") end),
  -- awful.key({ modkey, "Shift"   },  "Pause", function() awful.spawn("mtx") end),
  -- awful.key({ modkey, "Shift"   } , "Return", function () awful.spawn(terminal .. ' --class=Alacritty,MTMX -e mtx -a') end,   {description = "open nested tmx", group = "launcher" } ),

  -- awful.key({ modkey                 , "Shift"   } , "Return"                              , function () awful.spawn.with_shell(terminal .. ' --class=Alacritty,MTMX -o font.size=12.5 -e mtx -c uno') end                , {description = "open nested tmx" , group = "launcher" } )                                    ,
  -- awful.key({ modkey              , "Shift"   } , "Return"                              , function () awful.spawn(terminal .. ' --class=Alacritty,MTMX -e byobu -L free new-session -n " "') end , {description = "open nested tmx" , group = "launcher" } )                                    ,
  -- awful.key({ modkey              , "Shift"   } , "Return"                              , function () awful.spawn(terminal .. ' --class=Alacritty,MTMX -e byobu') end                             , {description = "open nested tmx" , group = "launcher" } )                                    ,
  -- awful.key({ modkey                 , }           , "Return"                              , function () awful.spawn(           terminal .. ' --class=Alacritty,MTMX -e mtx-uno') end                           , {description = "open nested tmx" , group = "launcher" } )                                    ,

    -- awful.spawn(terminal .. " --name=MTX_UNO /home/metaory/.local/bin/mtx" , { size_hints_honor = true, honor_workarea = false, honor_padding = false, -- margins = 100, -- offset = 200, pretend = false, attach = true, update_workarea = true, -- awful.placement.no_offscreen placement = awful.placement.bottom_left + awful.placement.no_overlap -- ,placement = awful.placement.no_overlap+awful.placement.no_offscreen } )

  -- awful.spawn.with_shell(terminal .. " --name=MTX_UNO mtx")
  -- awful.key({ modkey                     } , "Return" , function () awful.spawn(term_alacritty) end , {description = "open free term"                                                               , group = "launcher"  } )          ,
  -- awful.key({ modkey                     } , "Return", with_term(),                      { description = "open free term", group = "launcher"                         } ), -- awful.spawn(terminal, { x=40, y=600, } )

  -- awful.key({ modkey                } , "Return"    , function () awful.spawn.with_shell(term_termite .. " --class=MTMX -e 'mtx -s uno'") end , {description = "open free term"                                                               , group = "launcher"  } )          ,
  -- awful.key({ modkey            } , "Return"    , function () awful.spawn(terminal) end , {description = "open free term"                                                               , group = "launcher"  } )          ,
  -- awful.key({        }    , "KP_Subtract" , function() awful.screen.focused().defl_tmux:toggle() end)  ,
  --
  -- awful.key({     } , "KP_Subtract" , function () awful.spawn.with_shell(terminal .. ' --class=Alacritty,MTMX --option "initial_window_height" 30c " -o "initial_window_width  150c"}" "window.position={x: 120 , y: 200}" -e mtx -c uno') end            , {description = "open nested uno bottom" , group = "launcher" } ) ,
  -- TODO vol down
  -- awful.key({        } , "KP_Subtract" , function () awful.spawn.with_shell(terminal .. ' --name=MTX_UNO mtx -a uno') end , {description = "open nested uno bottom" , group = "launcher" } ) ,
  -- awful.key({        } , "KP_Add"      , function () awful.spawn.with_shell(terminal .. ' --name=MTX_UNO mtx -s uno') end , {description = "open nested uno center" , group = "launcher" } )                  ,

  -- awful.key({ modkey }, "KP_Add", function () awful.spawn("sudo light -A 2") end),
  --
  --#################################################################################
  -- ### CLIENT ##################################################################### 
  --#################################################################################

  -- awful.key({ modkey }, "Next",  function (c) c:relative_move( 20,  20, -40, -40) end),
  -- awful.key({ modkey }, "Prior", function (c) c:relative_move(-20, -20,  40,  40) end),
  -- awful.key({ modkey }, "Down",  function (c) c:relative_move(  0,  20,   0,   0) end),
  -- awful.key({ modkey }, "Up",    function (c) c:relative_move(  0, -20,   0,   0) end),
  -- awful.key({ modkey }, "Left",  function (c) c:relative_move(-20,   0,   0,   0) end),
  -- awful.key({ modkey }, "Right", function (c) c:relative_move( 20,   0,   0,   0) end),
  --
  -- awful.key({ modkey }, "Next",  function (c) c:relative_move( 20,  20, -40, -40) end),
  -- awful.key({ modkey }, "Prior", function (c) c:relative_move(-20, -20,  40,  40) end),

  -- TODO skipp c.fullscreen
  -- TODO move to with_relative_move 
  -- awful.key({ modkey, "Control", "Shift" } , "k", function (c)
  --   -- local cgeo = c:geometry()
  --   -- c:relative_move(cgeo.x, cgeo.y, cgeo.width - 10, cgeo.height)
  --   c:relative_move(c, -2)
  -- end, {description =   "swap with  next client by index" , group = "client"}) ,
  -- awful.key({ modkey, "Control", "Shift" } , "j", function (c)
  --   -- local cgeo = c:geometry()
  --   -- c:relative_move(cgeo.x, cgeo.y, cgeo.width + 10, cgeo.height)
  --   c:relative_move(c, 2)
  -- end, {description =   "swap with  next client by index" , group = "client"}) ,

  -- awful.key({ modkey }, "i",    client_leader, {description = "Leader client", group = "client"}),
  -- awful.key({ modkey, "Shift"   }, "c", function (c) c:kill() end, {description = "close", group = "client"}),
  -- awful.key({ modkey, "Shift" }, "b", function (c) c.border_width = 8 end, {description = "toggle border", group = "client"}),

-- awful.key({ modkey, "Control" }, "space", awful.client.floating.toggle, {description = "toggle floating", group = "client"}),
-- awful.key({ modkey, "Control" }, "space", awful.layout.floating, {description = "toggle floating", group = "client"}),
-- awful.key({ modkey, "Control" }, "space", function () awful.layout.set(awful.layout.floating) end),
-- awful.layout.suit.floating

-- awful.key({ modkey }, "z", function (c)
--   c.maximized_horizontal = not c.maximized_horizontal
--   c:raise()
-- end, {description = "test", group = "client"})
-- awful.placement.bottom_left(client.focus)

-- awful.key({ modkey, "Control" }, "Left", function (c)
-- snap_corner(c, 'bottom_left')
-- end, {description = "pane bottom_left", group = "client"}),
-- ................................................
-- awful.key({ modkey, "Control" }, "Right", function (c)
-- snap_corner(c, 'bottom_right')
-- end, {description = "pane bottom_right", group = "client"}),
-- ................................................
-- awful.key({ modkey, "Control" }, "Up", function (c)
-- snap_corner(c, 'top_left')
-- end, {description = "pane top_left", group = "client"}),
-- ................................................
-- awful.key({ modkey, "Control" }, "Down", function (c)
-- snap_corner(c, 'top_right')
-- end, {description = "pane top_right", group = "client"}),

-- ################################################
-- awful.placement.no_offscreen
-- awful.placement.closest_corner
--
      -- c.size_hints_honor = true
    -- __p("..++++++++++++++++++++++++++++++++++++>>")
    -- __p('size_hints_honor | honor_padding | honor_workarea')
    -- __p(c.size_hints_honor)
    -- __p(c.honor_padding)
    -- __p(c.honor_workarea)
    -- __p("----------------------------------------")
    -- c.honor_padding    = not c.honor_padding
    -- c.honor_workarea   = not c.honor_workarea

    --  c.border_width = c.border_width  + 1
    -- __p("..++++++++++++++++++++++++++++++++++++>>")
    -- __p('border_width: ' .. c.border_width)
    -- __p("----------------------------------------")
      -- c.border_width = 0
    -- end, {description = "clear border and size hint honor of all active tag clients", group = "tag"}),
    -- __p("..++????++++++++++++++++++++++++++++++>>")
    --           __p('c.size_hints_honor')
    --           __p(c.size_hints_honor)
    -- c.size_hints_honor = not c.size_hints_honor
    --           __p('border_width:bef ')
    --           __p(c.size_hints_honor)
    --
    --           __p('c.honor_padding')
    --           __p(c.honor_padding)
    -- c.honor_padding = not c.honor_padding
    --           __p('c.honor_padding')
    --           __p(c.honor_padding)
    --
    --           __p('c.size_hints_honor')
    --           __p(c.size_hints_honor)
    -- c.honor_workarea = not c.honor_workarea
    --           __p('c.honor_workarea')
    --           __p(c.honor_workarea)
    -- __p("----------------------------------------")
--

  --   -- c.maximized_vertical = false
  --   -- c.width = c.screen.geometry.width
  --   if c.maximized_horizontal then
  --     c.maximized_horizontal = false
  --     awful.placement.bottom_left(c)
  --     awful.placement.no_overlap(c)
  --   else
  --     c.maximized_horizontal = true
  --     c.x = 0
  --     c.y = c.screen.geometry.height - 558
  --     c.height = 560
  --   end
  --   c:raise()
  -- end, {description = "(un)maximize horizontally", group = "client"}),


  -- awful.key({ modkey, 'Control' }, "k", function () awful.client.incwfact( 0.05) end , {description = "increase client width factor" , group = "client"}) ,
  -- awful.key({ modkey, 'Control' }, "j", function () awful.client.incwfact(-0.05) end , {description = "decrease client width factor" , group = "client"}) ,
  --   awful.client.incwfact(-0.05, c)

  -- awful.key({ modkey , "Shift"             } , "h"       , function () awful.tag.incnmaster( 1        , nil                                           , true) end          , {description = "increase the number of master clients" , group = "layout"                                       } )                              ,
  -- awful.key({ modkey , "Shift"             } , "l"       , function () awful.tag.incnmaster(-1        , nil                                           , true) end          , {description = "decrease the number of master clients" , group = "layout"                                       } )                              ,

  --[[ awful.key({ modkey , "Control"           } , "l"       , function (c) 
     [   if c.floating then
     [     local cgeo = c:geometry()
     [     c:geometry({x = cgeo.x, y = cgeo.y, width = cgeo.width + 10, height = cgeo.height })
     [   else
     [     awful.tag.incmwfact( 0.01)
     [   end
     [ end , {description = "increase master width factor" , group = "layout"                                                                                                                     } ) ,
     [ awful.key({ modkey , "Control"           } , "h"       , function (c)
     [   if c.floating then
     [     local cgeo = c:geometry()
     [     c:geometry({x = cgeo.x, y = cgeo.y, width = cgeo.width - 10, height = cgeo.height })
     [   else
     [     awful.tag.incmwfact(-0.01)
     [   end
     [ end , {description = "decrease master width factor" , group = "layout"                                                                                                                     } ) ,
     [ ----
     [ awful.key({ modkey, "Control" }, "j", function (c)
     [   if c.floating then
     [     local cgeo = c:geometry()
     [     c:geometry({x = cgeo.x, y = cgeo.y, width = cgeo.width, height = cgeo.height - 10 })
     [   else
     [     awful.client.incwfact(-0.01, c)
     [   end
     [ end , {description = "increase client width factor" , group = "client"}) ,
     [ awful.key({ modkey, "Control" }, "k", function (c)
     [   if c.floating then
     [     local cgeo = c:geometry()
     [     c:geometry({x = cgeo.x, y = cgeo.y, width = cgeo.width, height = cgeo.height + 10 })
     [   else
     [     awful.client.incwfact(-0.01, c)
     [   end
     [ end , {description = "decrease client width factor" , group = "client"}) , ]]


  -- awful.key({ modkey,}, "a", function (c)
  --   awful.client.incwfact( 0.05, c)
  --   end, {description = "set size_hints_honor true", group = "client"}),
  -- awful.key({ modkey,}, "d", function (c)
  --   awful.client.incwfact(-0.05, c)
  --   end, {description = "set size_hints_honor true", group = "client"}),
