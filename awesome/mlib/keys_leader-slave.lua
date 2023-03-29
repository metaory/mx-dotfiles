local lain = require("lain")
local gears = require("gears")
local awful = require("awful")
local naughty = require("naughty")
local leader = require "awesome-leader-slave"
local xresources = require("beautiful.xresources")
local xc = xresources.get_current_theme()
local with_wrapper = require('mlib/with_wrapper')
-- local mtheme = require('mtheme')
local thm = require("beautiful")

local ala_opt_center      = ' -o "initial_window_height" 30c" -o "initial_window_width 150c" '
local ala_opt_full_bottom = ' -o "initial_window_height" 20c" -o "initial_window_width 173c" '
local ala_opt_gap_bottom  = ' -o "initial_window_height" 15c" -o "initial_window_width 160c" '
local ala_opt_gap_corner  = ' -o "initial_window_height" 15c" -o "initial_window_width 80c"  '
local kit_opt_pad_small   = ' -o "window_padding_width 10" '
local kit_font_small      = ' -o "font_size 13.0" '

local ala_opt_pad_small   = ' --option "window.padding={x: 10, y: 10}" font.size=11.0 '

local spawn_keys = leader.bind_actions({
    {"m", with_wrapper.spawn('min'), "min-browser"},
    {"c", with_wrapper.spawn('chromium'), "chromium"},
    {"s", with_wrapper.spawn('spotify', {placement = awful.placement.centered}), "spotify"},
    {"S", with_wrapper.spawn('slack'), "slack"},
    {"t", with_wrapper.spawn('steam'), "steam"},
    {"K", with_wrapper.spawn('screenkey --bg-color "'..xc.xbg..'" --font-color "'..xc.wbg..'"'), "screenkey"},
    {"T", with_wrapper.spawn('telegram-desktop'), "telegram"},
})
local kill_keys = leader.bind_actions({
    {"p", with_wrapper.shell("killall picom"), "Kill Picom"},
    {"c", with_wrapper.shell("killall chromium"), "Kill chromium"},
    {"s", with_wrapper.shell("killall spotify"), "Kill spotify"},
    {"k", with_wrapper.shell("killall kitty"), "Kill kitty"},
    {"K", with_wrapper.shell("killall screenkey"), "Kill screenkey"},
})
local exec_keys = leader.bind_actions({
    {"m", with_wrapper.shell("sudo mount /dev/sdc1 ~/mnt"), "Mount"},
    {"M", with_wrapper.shell("sudo umount /dev/sdc1"), "Unmount"},
    {"p", with_wrapper.shell("picom --experimental-backend & disown"), "Picom"},
    {"t", with_wrapper.term(kt_m_opt .. MX.kitty_opt_h.. MX.kitty_opt_c.."-T rtorrent rtorrent"), "rtorrent"},
    {"e", with_wrapper.term(kt_m_opt .. MX.kitty_opt_h.."-T ranger ranger"), "explore"},
    -- {"e", with_wrapper.term(kt_m_opt .. "-T ranger ranger"), "explore"},
    -- {"d" , with_wrapper.term(kt_m_opt .. "-T today nvim -c 'execute"..'"normal :new :\\<Plug>VimwikiMakeDiaryNote"'.."'") , "diary-today"} ,
  -- -T diary -T wiki 
    {"d" , with_wrapper.term(kt_m_opt .. " nvim -c 'VimwikiDiaryIndex'") ,"diary-index"},
    {"w" , with_wrapper.term(kt_m_opt .. " nvim -c 'VimwikiIndex'")      ,"wiki-index"},

    {"H" , with_wrapper.term(kt_m_opt .. "-T dhint  bat /home/meta/vimwiki/docs/cht-devhint.md"), "dev-hints"}   ,

    {"E", with_wrapper.term(kt_m_opt .. "-T nnn nnn"), "nxplore"},
})
 -- table: 0x5573f7be0e50
 --  query : https://www.wikipedia.org/w/index.php?title=Special:Search&search=%s (string)
 --  ico : 樂 (string)
 --  label : wki (string)
-- ############################################################### 
-- -- awful.screen.focused().defl_tmux:toggle() end                    ,       "default_tmux"},
-- local query_keys = leader.bind_actions({
--     {"q", with_wrapper.query_prompt("q")," ggl"},
--     {"Q", with_wrapper.query_prompt("Q")," ggl"},
--     {"g", with_wrapper.query_prompt("g")," git"},
--     {"n", with_wrapper.query_prompt("n"),"ﰩ npm"},
--     {"w", with_wrapper.query_prompt("w")," awm"},
--     {"a", with_wrapper.query_prompt("a"),"卑arc"},
--     {"A", with_wrapper.query_prompt("A"),"卑arc"},
--     {"m", with_wrapper.query_prompt("m")," man"},
--     {"u", with_wrapper.query_prompt("u"),"喝aur"},
--     {"b", with_wrapper.query_prompt("b")," bbs"},
--     {"k", with_wrapper.query_prompt("k"),"樂wki"},
--     desc = "query"
-- })
-- ############################################################### 

 
local _query = {keys={},i=1}
for key, _ in pairs(thm.search) do
  local item = thm.search[key]
  _query.keys[_query.i]  = {key, with_wrapper.query_prompt(key), string.format('%s %s',item.ico, item.label) }
  _query.i = _query.i + 1
end         
_query.keys[_query.i+1]  = { desc = "query" }
local query_keys = leader.bind_actions( _query.keys)
 
-- ############################################################### -- awful.screen.focused().defl_tmux:toggle() end                    ,       "default_tmux"},
-- local _web   = {keys={},i=1}
-- for key, _ in pairs(mtheme.web) do
  -- local item = mtheme.web[key]
  -- _web.keys[_web.i]  = {key, with_wrapper[item.app](item.value), string.format('%s %s',item.ico, item.label) }
  -- _web.i = _web.i + 1
-- end
-- local web_keys = leader.bind_actions( _web.keys)
--
-- ============================================================ --
local menu_keys = leader.bind_actions({
    {"m", function() 
        awful.menu.client_list({ theme = { width = 350 } })
    end, "menu"},
    desc = "menu_binds"
})
-- ============================================================ --
local web_keys = leader.bind_actions({
    {"i", with_wrapper.chromium(" --incognito"), "incognito"},
    {"I", with_wrapper.chromium(" --incognito https://hentaisun.com https://sukebei.nyaa.si/?f=0&c=1_1&q="), "echi"},

    {"W", with_wrapper.chromium(""), "empty"},
    {"w", with_wrapper.chromium_app("https://metaory.github.io?fg="..thm.fg_normal:sub(2)..'&bg='..thm.bg_normal:sub(2)), "home"},
    {"g", with_wrapper.chromium("https://github.com"), "github"},
    {"a", with_wrapper.chromium("https://nyaa.si/?f=0&c=1_2&q=720 https://nyaa.si/?f=0&c=1_2&q=erai+720 https://anilist.co/search/anime?year=2021&season=FALL"),"anilist"},
    {"n", with_wrapper.chromium_app("https://www.netflix.com"), 'Netflix'},
    {"y", with_wrapper.chromium_app("https://www.youtube.com"), "youtube"},
    desc = "web_binds"
})
-- .............................................................
-- TODO XXX
local iweb_keys = leader.bind_actions({
    {"m", function() 
        awful.menu.client_list({ theme = { width = 350 } })
    end, "iweb"},
    desc = "iweb_binds"
})
-- ############################################################### 
local term_keys =          leader.bind_actions({

      {"l"             , with_wrapper.shell(terminal..' less /tmp/mxsh.log')      , "MXSH_log"} ,
      {"t"             , with_wrapper.shell(terminal..' --name=MTX_MASTER mtx -n master')      , "start_master_mtx"} ,
      -- {"t"             , with_wrapper.shell(terminal..' --name=MTX_MASTER -o "initial_window_height 12c" mtx -n master')      , "start_master_mtx"} ,
      -- {"T", with_wrapper.shell( term_mst..' --name=MTX_MASTER -o "initial_window_height 12c" mtx -n master')      , "start_master_mtx"} ,
      -- {"T"       , with_wrapper.term('--name=MTX_UNO mtx -n', terminal)      , "start_uno_shared"} ,
      -- {"T"       , with_wrapper.term('--class MTX_MASTER -e mtx -n master', term_alacritty)      , "start_master_mtx_ALA"} ,

      {"k" , with_wrapper.term       , "kitty"}    ,
      -- {"K" , with_wrapper.term(' --title DEDICT_KITTY'                       , term_kitty)     , "dedict_term_kitty"}    ,
      {"a" , with_wrapper.term(' --title ALACRITTY'                          , term_alacritty) , "start_term_alacritty"} ,
      {"u" , with_wrapper.term(terminal..' --name=MTX_UNO' ..term_mtx..'mtx -n')     , "start_uno"}            ,
      -- {"U" , with_wrapper.term(' --title SHARED_UNO --name = MTX_UNO mtx'    , terminal)       , "attach_uno"}           ,

-- { modkey,         shiftk } , "Return", with_wrapper.term("--name=MTX_UNO mtx"),                        { description = "attach to existing uno" , group = "launcher"      } )
-- { modkey, ctrlky, shiftk } , "Return", with_wrapper.term("--name=MTX_UNO mtx -n"),                     { description = "open nested tmx" , group = "launcher"             } )
-- { modkey, altkey         } , "Return", with_wrapper.term("--name=MTX_UNO mtx -n", term_kitty),         { description = "open nested tmx" , group = "launcher"             } )
-- { modkey, altkey, ctrlky } , "Return", with_wrapper.term("--class MTX_UNO -e mtx -n", term_alacritty), { description = "open nested tmx" , group = "launcher"             } )
        --
      {"K", function()
            awful.spawn.with_shell(terminal .. " mtx -k master")
            awful.spawn.with_shell(terminal .. " mtx -k slave")
            awful.spawn.with_shell(terminal .. " mtx -k uno")
        end, "Kill all mtx"},
      {"1" , with_wrapper.mtx('master_tmux', 'toggle'),"toggle_master_tmx"},
      {"2" , with_wrapper.mtx('slave_tmux', 'toggle'), "toggle_slave_tmx"},
      desc      =          "tmux_binds"
})

  -- awful.key({ modkey, "Control"}, "F1", function () awful.spa______h_shell("./dev/scripts/xrandr/f1-laptop.sh") end),
  -- awful.key({ modkey, "Control"}, "F2", function () awful.spa______h_shell("./dev/scripts/xrandr/f2-screen.sh") end),
  -- awful.key({ modkey, "Control"}, "F3", function () awful.spa______h_shell("./dev/scripts/xrandr/f3-dual.sh") end),
  -- awful.key({ modkey, "Control"}, "F4", function () awful.spa______h_shell("./dev/scripts/xrandr/f4-mirror.sh") end),
  -- awful.key({ modkey, "Control"}, "F5", function () awful.spa______h_shell("./dev/scripts/xrandr/f5-dpi.sh") end)
-- ############################################################### --
         --
local mlog = function (title, text) 
  if M_DEBUG then
    naughty.notify({ preset = naughty.config.presets.info, title = title .. ": ", text = tostring(text) })
  end
end
local with_move_corner = function(d)
  return function()
    local c = client.focus
    if c then
      local _d
      mlog("with_move_corner::" .. d, c.x .. ':' .. c.y .. '  ' .. c.width .. '*' .. c.height)

      local h_side = ((c.x + (c.width)  / 2) > (c.screen.geometry.width  / 3) and 'right'  or 'left')
      local v_side = ((c.y + (c.height) / 2) > (c.screen.geometry.height / 3) and 'bottom' or 'top')

      local h_side = ((c.x + (c.width)  / 2) > (c.screen.geometry.width  / 2) and 'right'  or 'left')
      local v_side = ((c.y + (c.height) / 2) > (c.screen.geometry.height / 2) and 'bottom' or 'top')

      mlog("h_side", h_side) mlog("v_side", v_side)
      if d ==  v_side or d == h_side then
        c.border_width = thm.border_width
        c.border_color = thm.fg_urgent
        mlog("set stretch", 'stretch_' .. d)
        local m_order = (d == 'top' or 'down') and 'maximized_horizontal' or 'maximized_vertical'
        mlog("set maximized", m_order)
        c[m_order] = not c[m_order]
      else
        c.border_color = thm.border_normal
        _d = ((d == 'top' or d == 'bottom') and (d..'_'..h_side) or (v_side..'_'..d))
        -- if d == 'top' or d == 'bottom' then _d = d .. '_' .. h_side else _d = v_side .. '_' .. d end
        mlog("set corner", _d)
        awful.placement[_d](c, { honor_workarea = true, margins = 10 })
      end
    end
  end
end
-- #############################################################################
local with_flag_toggle = function(d)
  return function() 
    local c = client.focus
    -- mdbg_p('__with flag: ' .. d .. ' before: ')
    -- mdbg_p(c[d])
    -- mdbg_p(gears.debug.dump_return(c, 'WITH_FLAG: ' .. d))
    -- mdbg_p(gears.debug.dump_return(c, 'WITH_FLAG: ' .. d))
    if c then 
      local _ = { fr = c[d], to = not c[d] }
      c[d] = _.to
      naughty.notify({ title = d, text = gears.debug.dump_return(_, 'WITH_FLAG'), timeout = 5 })
    end
  end
end
-- #############################################################################
local with_border_toggle = function()
  return function()
        local c = client.focus
        if c then
          c.border_width = c.border_width == 0 and thm.border_width or 0
          naughty.notify({ text = 'border: ' .. c.border_width, timeout = 5 })
        end
  end
end
-- #############################################################################
local with_prop_upd = function(prop, upd, opt)
  return function()
    local c = client.focus
    if c then
      -- local _ = { fr = c[prop], to = c[prop] + upd }
      -- if opt then
        -- _.to = _.to >= opt.max and opt.max or _.to
        -- _.to = _.to <= opt.min and opt.min or _.to
        -- c[prop] = _.to
      -- else
        -- c[prop] = upd
      -- end
      -- naughty.notify({ title = prop, text = 'border: ' .. c.border_width, timeout = 5 })
      c[prop] = upd
      naughty.notify({ title = prop, text = tostring(upd), timeout = 5 })

      -- c:apply_size_hints()
      -- c:raise()
    -- if client.focus then client.focus:raise() end
      -- naughty.notify({ title = prop, text = gears.debug.dump_return(upd, 'border: ' .. c.border_width), timeout = 5 })
    end
  end
end
-- #############################################################################
-- local with_force_snap_corner = function(d)
--   return function()
--         local c = client.focus
--         if c then awful.placement[d](c, { honor_workarea = true, margins = 10 })
--         end
--   end
-- end
-- ############################################################### --
-- --------------------------------------------------------------- --
-- #############################################################################
local with_layout = function(l) return function() awful.layout.set(l) end end
-- #############################################################################
local lead_layout_keys = leader.bind_actions({

  {"z" , with_layout(awful.layout.suit.floating)        , "FLOATING awfu"}    ,
  {"z" , with_layout(awful.layout.suit.floating)        , "FLOATING awfu"}    ,
  {"0" , with_layout(awful.layout.suit.floating)        , "FLOATING awfu"}    ,

  {"l" , with_layout(awful.layout.suit.tile)            , "TILE awfu"}        ,
  {"1" , with_layout(awful.layout.suit.tile)            , "TILE awfu"}        ,
  {"2" , with_layout(awful.layout.suit.tile.left)       , "TILE.LEFT awfu"}   ,
  {"3" , with_layout(awful.layout.suit.tile.bottom)     , "TILE.BOTTOM awfu"} ,
  {"L" , with_layout(awful.layout.suit.tile.top)        , "TILE.TOP awfu"}    ,
  {"4" , with_layout(awful.layout.suit.tile.top)        , "TILE.TOP awfu"}    ,

  {"f" , with_layout(awful.layout.suit.fair)            , "FAIR awfu"}        ,
  {"5" , with_layout(awful.layout.suit.fair)            , "FAIR awfu"}        ,
  {"F" , with_layout(awful.layout.suit.fair.horizontal)            , "FAIR awfu"}        ,
  {"6" , with_layout(awful.layout.suit.fair.horizontal)            , "FAIR awfu"}        ,

  -- {"F" , with_layout(lain.layout.termfair)              , "TERMFAIR lain"}          ,
  {"n" , with_layout(lain.layout.termfair)              , "TERMFAIR lain"}          ,
  {"N" , with_layout(lain.layout.termfair.center)       , "TERMFAIR.CENTER lain"}   ,

  {"c" , with_layout(lain.layout.cascade)               , "CASCADE lain"}           ,
  {"C" , with_layout(lain.layout.cascade.tile)          , "CASCADE.TILE lain"}      ,
  {"8" , with_layout(lain.layout.cascade)               , "CASCADE lain"}           ,
  {"9" , with_layout(lain.layout.cascade.tile)          , "CASCADE.TILE lain"}      ,
    desc = "lead_layout_binds"
})
-- ................................................
-- ################################################
local lead_client_keys = leader.bind_actions({
    {"h" , with_move_corner("left")      , "left"}      ,
    {"l" , with_move_corner("right")     , "right"}     ,
    {"k" , with_move_corner("top")       , "top"}       ,
    {"j" , with_move_corner("bottom")    , "bottom"}    ,

    -- {"c" , with_move_corner("bottom")    , "center"}    ,

    {"S" , with_flag_toggle("size_hints_honor")     , "size_hints_honor"}   ,
    {"h" , with_flag_toggle("maximized_horizontal") , "maximized_horizont"} ,
    {"v" , with_flag_toggle("maximized_vertical")   , "maximized_vertical"} ,
    {"m" , with_flag_toggle("maximized")            , "maximized"}          ,
    {"f" , with_flag_toggle("floating")             , "floating"}           ,
    {"a" , with_flag_toggle("above")                , "above"}              ,
    {"t" , with_flag_toggle("sticky")               , "sticky"}             ,
    {"b" , with_flag_toggle("below")                , "below"}              ,
    
    {"B", with_border_toggle(), "border"},

-- ................................................
})

function mouse_focus_sig(c)
  c:emit_signal("request::activate", "mouse_enter", {raise = false})
end

-- awful.key({ } , "KP_Home"              , with_wrapper.shell("playerctl -p spotify previous")),
-- awful.key({ } , "KP_Up"                , with_wrapper.shell("playerctl -p spotify play-pause")),
-- awful.key({ } , "KP_Prior"             , with_wrapper.shell("playerctl -p spotify next")),
SecondaryLeader = leader.leader(
  leader.wrap(
    leader.repeat_count,
    leader.bind({

        -- {"KP_Home", leader.action(function() end), "Logs"},
        {"KP_Up", leader.action(function () mouse.screen.mywibox.visible = not mouse.screen.mywibox.visible end), "Toggle Wibar"},
        {"KP_Begin", leader.action(with_wrapper.mtx('master_tmux', 'toggle')), "kp-mtx"},
      -- , awful.key({        } , "KP_Begin", with_wrapper.mtx('master_tmux', 'toggle'))

            
        {"a", leader.bind_actions({
              {"I", with_wrapper.shell("xcalib -a -i"), "xcalib-Invert"},
              {"4"    , with_wrapper.shell("xcalib -c && xcalib -a -co 40")  , "xcalib-Contrast-Set_40"}  ,
              {"5"    , with_wrapper.shell("xcalib -c && xcalib -a -co 50")  , "xcalib-Contrast-Set_50"}  ,
              {"6"    , with_wrapper.shell("xcalib -c && xcalib -a -co 60")  , "xcalib-Contrast-Set_60"}  ,
              {"7"    , with_wrapper.shell("xcalib -c && xcalib -a -co 70")  , "xcalib-Contrast-Set_70"}  ,
              {"8"    , with_wrapper.shell("xcalib -c && xcalib -a -co 80")  , "xcalib-Contrast-Set_80"}  ,
              {"9"    , with_wrapper.shell("xcalib -c && xcalib -a -co 90")  , "xcalib-Contrast-Set_90"}  ,
              {"0"    , with_wrapper.shell("xcalib -c && xcalib -a -co 100") , "xcalib-Contrast-Set_100"} ,
              {"X", with_wrapper.shell("xcalib -c"), "xcalib-Clear"},
            {"w", function () mouse.screen.mywibox.visible = not mouse.screen.mywibox.visible end, "awm-wibar_toggle"}, desc = "awesome_wb" })
          , "WM"
        },
        {"c", lead_client_keys, "Client"},
        {"w", web_keys, "Web"},
        {"W", iweb_keys, "IWeb"},
        {"t", term_keys, "Term"},
        {"m", menu_keys, "Menu"},
        {"s", spawn_keys, "Spawn"},
        {"l", lead_layout_keys, "Layout"},
        {"q", query_keys, "Query"},
        {"g", leader.bind_actions({
              {"m", function(c) client.connect_signal("mouse::enter", mouse_focus_sig) end, "connect_mouse_focus"}   ,
              {"M", function(c) client.disconnect_signal("mouse::enter", mouse_focus_sig) end, "disconnect_mouse_focus"}   ,
          desc = "global_signals" }) , "Global_signals"}              ,
        {"v", leader.bind_actions({
              {"b", with_wrapper.voice.bat, "bat"},
              {"u", with_wrapper.voice.uptime, "uptime"}, 
              {"v",
                function ()
                  with_wrapper.voice.bat()
                  os.execute("sleep 8")
                  with_wrapper.voice.uptime()
          end
          , "full report"}, 
        desc = "voice" }), "voice"
      },

      {"k", kill_keys, 'KillAlls'},
        {"e", exec_keys, 'Execs'},
        {"L", leader.action(function()
          mdbg_t({att='LEADER LS'}, "LEAD_DBG")
          awful.spawn.with_shell(terminal..' --title XSession --class M_SYS_LOG ' .. kit_opt_pad_small..' tail -f ~/.xsession-errors')
          awful.spawn.with_shell(terminal..' --title Journal  --class M_SYS_LOG ' .. kit_opt_pad_small..' journalctl -f')
          mdbg_t({att='LEADER LE'}, "LEAD_DBG__END")
        end), "Logs"},
  }))
)
return SecondaryLeader
