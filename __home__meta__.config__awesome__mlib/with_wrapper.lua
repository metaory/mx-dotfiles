local awful = require("awful")
local gears = require("gears")
local _wc = require("mlib/with_client")

with_wrapper = {}

with_wrapper.term = function(cmd, term)
  return function()
    mdbg_p((term or terminal))
    mdbg_p((cmd or ''))
    awful.spawn.with_shell((term or terminal)  .. ' ' .. (cmd or ''))
  end
end
with_wrapper.shell = function(cmd)
  return function()
  mdbg_p('withshell ') mdbg_p(cmd) 
    awful.spawn.with_shell(cmd)
  end
end
with_wrapper.spawn = function(app, opt)
  return function()
  mdbg_p('withspawn ') mdbg_p(app) mdbg_p(opt)
  -- mdbg_t(opts, 'withspawn-opt ')
  awful.spawn(app, opt)
  end
end
with_wrapper.firefox_app = function(url)
     return function()
       awful.spawn('firefox-developer-edition --kiosk ' .. url)
     end
end
with_wrapper.chromium_app = function(url)
     return function()
       awful.spawn('chromium --app=' .. url)
     end
end
with_wrapper.chromium = function(url)
     return function()
       awful.spawn('chromium --new-window ' .. url)
     end
end
with_wrapper.mtx = function(name, method)
     return function()
       awful.screen.focused()[name]:toggle()
       -- awful.screen.focused().master_tmux:toggle() end)
     end
end

----------------
local m_search_prompt = require("mlib/m_search_prompt")
with_wrapper.query_prompt = function(se)
     return function()
       m_search_prompt.launch(se or 'ggl') 
     end
end
----------------
local m_prompt = require("mlib/m_prompt")
with_wrapper.prompt = function()
  return function() m_prompt.launch() end
end

with_wrapper.with_mfz = function(cmd)
  return function()

    local _o     = {
      [ 'mfz-web' ] = { w = 100, h = 18 },
      [ 'mfz-run' ] = { w = 40, h = 16 },
      w=40,h=20,o=0.6, f=20, c='MFZ',
      -- b=xc.color1
    }

    local opt={
      w=string.format(' -o "initial_window_width %sc" '  , _o[cmd].w or _o.w) ,
      h=string.format(' -o "initial_window_height %sc" ' , _o[cmd].h or _o.h) ,
      o=string.format(' -o "background_opacity %s" '     , _o.o)      ,
      -- o=string.format(' -o "background %s" '             , _o.b)      ,
      f=string.format(' -o "font_size %s" '              , _o.f)      ,
      c=string.format(' --class=%s '                     , _o.c)      ,
    }

    local formatted_cmd = term_kitty..opt.c..opt.o..opt.w..opt.h..opt.f..cmd
    mdbg_t({x=_o,o=opt,f=formatted_cmd}, 'WITH_MFZ  ' .. cmd)

    -- mdbg_p('## WITH_BEGIN #################### >>>>') mdbg_p(_mfz.showing)
    -- local initial_width = cmd == 'mfz-web' and 100 or 70
    -- local formatted_cmd = terminal .. ' --class=MFZ -o "background_opacity 0.6"  -o "initial_window_height 10c"  -o "initial_window_width '..initial_width..'c" ' .. cmd
    awful.spawn.easy_async_with_shell(formatted_cmd, function(stdouz,z)
      mdbg_p('>>>>>CB:') mdbg_p(stdouz) mdbg_p(z) mdbg_p('<<<<<CB:')
      awful.spawn.easy_async_with_shell("head -n 1 /tmp/" .. cmd .. "-cmd", function(stdout)
        mdbg_p('@@@@@CB:') mdbg_p(stdout) mdbg_p('^^^^^CB:') mdbg_p('^^^^^^^^^^^^^^^^^^^^^^')
        if #stdout > 2 then awful.spawn(stdout) end
      end)
    end)
    mdbg_p('## WITH_END   #################### <<<<')
  end
end
-- with_wrapper.shell = function(cmd) return function() awful.spawn.with_shell(cmd) end end
-- with_wrapper.chromium_app = function(url) return function() awful.spawn('chromium --app=' .. url) end end
-- with_wrapper.chromium = function(url) return function() awful.spawn('chromium --new-window ' .. url) end end
-- with_wrapper.quake_self = function(name, method) return function() awful.screen.focused()[name]:toggle() end end
-- ggl git npm awm lnx aur bbs

with_wrapper.voice = {
  bat = with_wrapper.shell('espeak -a 30 "$(cat /sys/class/power_supply/BAT0/capacity)%"'),
  uptime = with_wrapper.shell('espeak -a 30 "$(uptime -p)"'),
              -- {"b", with_wrapper.shell('espeak -a 30 "$(cat /sys/class/power_supply/BAT0/capacity)%"'), "vbat"},
              -- {"u", with_wrapper.shell('espeak -a 30 "$(uptime -p)"'), "uptime"},
}
----------------
return gears.table.join(with_wrapper,_wc)
    -- awful.spawn.with_shell(terminal  .. ' ' .. (cmd or ''))
    -- mdbg_p('with term !!!')
    -- mdbg_p(terminal)
    -- mdbg_p(cmd)
    -- mdbg_p(terminal  .. ' ' .. (cmd or ''))
    -- awful.spawn.spawn(terminal  .. ' ' .. (cmd or ''), opt)
