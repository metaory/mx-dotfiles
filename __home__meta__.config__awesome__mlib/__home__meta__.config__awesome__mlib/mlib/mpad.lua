local awful = require("awful")
local gears = require("gears")

local bling = require("bling")
-- local awestore = require("awestore")                  -- Totally optional, only required if you are using animations.

local sgeo = awful.screen.focused().geometry
local padopts = {
  sticky = true,
  autoclose = true,
  floating = true,
  geometry = {
    x=sgeo.x + 100,
    y=sgeo.y + 100,
    height=sgeo.height - (200),
    width=sgeo.width - (200)
  },
  reapply = true,
  dont_focus_before_close  = false,
}
-- local wka = client.focus.screen.workarea

term_scratch = bling.module.scratchpad:new {
    command = terminal.." --class spad",
    rule = { instance = "spad" },
    sticky = true,
    autoclose = true,
    floating = true,
    geometry = padopts.geometry,
    reapply = false,
    dont_focus_before_close  = false,
}
----------------
ddoc_scratch = bling.module.scratchpad:new {
    command = "chromium --app=https://devdocs.io/",
    rule = { instance = "devdocs.io" },
    sticky = true,
    autoclose = true,
    floating = true,
    geometry = {x=sgeo.width * 0.58, y=90, height=sgeo.height * 0.75, width=sgeo.width * 0.4}, 
    reapply = false,
    dont_focus_before_close  = false
  }
----------------
Web_scratch = bling.module.scratchpad:new {
    command = "chromium --app=https://metaory.github.io/",
    rule = { instance = "metaory.github.io" },
    sticky = true,
    autoclose = true,
    floating = true,
    geometry = {x=sgeo.width * 0.58, y=90, height=sgeo.height * 0.75, width=sgeo.width * 0.4}, 
    reapply = false,
    dont_focus_before_close  = false
  }
-- metaory.github.io
----------------
return gears.table.join(term_scratch, ddoc_scratch)

    --
    -- geometry = {x=0, y=90, height=900}, -- The geometry in a floating state
    -- awestore = {x = anim_x, y = anim_y}               -- Optional. This is how you can pass in the stores for animations.
    -- If you don't want animations, you can ignore this option.
    --   -- How to spawn the scratchpad
    -- command = "wezterm start --class spad",        
      -- How to spawn the scratchpad
      -- The rule that the scratchpad will be searched by
      -- Whether the scratchpad should be sticky
      -- Whether it should hide itself when losing focus
      -- Whether it should be floating
      -- The geometry in a floating state
      -- Whether all those properties should be reapplied on every new opening of the scratchpad (MUST BE TRUE FOR ANIMATIONS)
      -- When set to true, the scratchpad will be closed by the toggle function regardless of whether its focused or not. When set to false,
      -- --   the toggle function will first bring the scratchpad into focus and only close it on a second call
