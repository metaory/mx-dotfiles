local awful = require("awful")
local lain = require("lain")
    -- |-- termfair
    -- |-- termfair.center
    -- |-- cascade
    -- |-- cascade.tile
    -- |-- centerwork
    -- |-- centerwork.horizontal

awful.layout.layouts = {

  awful.layout.suit.floating        ,
  awful.layout.suit.tile.right      ,
  awful.layout.suit.tile.left       ,
  awful.layout.suit.tile.bottom     ,
  awful.layout.suit.tile.top        ,

  awful.layout.suit.fair            ,
  awful.layout.suit.fair.horizontal ,
  -- lain.layout.termfair              ,
  lain.layout.termfair.center       ,
  lain.layout.cascade               ,
  -- lain.layout.centerwork            ,
  -- lain.layout.centerwork.horizontal ,
  awful.layout.suit.corner.sw       ,
  awful.layout.suit.max             ,

  -- lain.layout.cascade.tile,

  -- awful.layout.suit.fair.horizontal,
  -- awful.layout.suit.spiral,
  -- awful.layout.suit.spiral.dwindle,
  -- awful.layout.suit.max.fullscreen,
  -- awful.layout.suit.magnifier,
  -- awful.layout.suit.corner.nw,
  -- awful.layout.suit.corner.ne,
  -- awful.layout.suit.corner.se,
}
-- }}}

