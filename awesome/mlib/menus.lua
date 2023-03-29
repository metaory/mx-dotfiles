local awesome
local awful = require("awful")
local thm = require("beautiful")
local mmenus = {}
local client = client
local steam        = "steam"
-- local insomnia     = "insomnia"
local spotify      = "spotify"
 --force-device-scale-factor        = 1.5"
-- local 
local etc_menu = {
  { "Steam", steam, thm.steam_icon },
  -- { "trello", trello, thm.ticket_icon },
  { "rTorrent", rtorrent, thm.rtorrent_icon },
  -- { "Insomnia", insomnia, thm.webstorm_icon },
  { "Slack", slack, thm.slack_icon },
    { "Atom", atom, thm.webstorm_icon }
  -- { "Webstorm", webstorm, thm.webstorm_icon }
}
local media_menu = {
  { "Netflix"    , netflix    , thm.netflix_icon }    ,
  { "Youtube"    , youtube    , thm.youtube_icon }    ,
  { "soundcloud" , soundcloud , thm.soundcloud_icon } ,
  { "Popcorn"    , popcorn    , thm.no_3 }
}

mmenus.mymainmenu = awful.menu({
  items = {
    --  { "Webstorm",   webstorm, thm.webstorm_icon },
    --  { "Atom",       atom, thm.atom_icon },
    -- { "Terms", atom, thm.webstorm_icon },
    { "Spotify", spotify, thm.spotify_icon },
    -- { "Atom", atom, thm.webstorm_icon },
    { "media", media_menu, thm.media_icon },
    { "etc", etc_menu, thm.etc_icon },
    { "ranger", ranger, thm.files_icon },
   -- { "restart", awesome.restart },
    -- { "ranger",
    --   function()
    --     awful.spawn(terminal .. ' --title ranger -e ranger',{
    --         floating  = true,
    --         placement = awful.placement.bottom_right,
    --         tag = root.tags()[4],
    --       })
    --      end,
    --      thm.fm_icon
    -- },
    { "chromium", chromium, thm.chromium_icon }
  }
})

mmenus.term_menu = function ()
  -- terms = {}
  -- for i, c in pairs(client.get()) do
    -- if awful.rules.match_any(c, {class = "kitty"}) then
      -- terms[i] =
        -- {c.name,
         -- function()
           -- c.first_tag:view_only()
           -- client.focus = c
         -- end,
         -- c.icon
        -- }
    -- end
  -- end
  -- awful.menu(terms):show()
-- awful.menu.client_list({ theme = { width = 250,  } }, {icon = ''}, m_filter_mfz)
                                              awful.menu.client_list({ theme = { width = 250 } })
end


-- local etc_menu = {
  -- { "Steam", steam, thm.steam_icon },
  -- { "rTorrent", rtorrent, thm.rtorrent_icon },
-- }
    -- { "etc", etc_menu, thm.etc_icon },
-- /////////////////////////////////////// --
mmenus.grd_menu = function ()
-- local nums = { '0' = '' , '1' = '' , '2' = '' , '3' = '' , '4' = '' , '5' = '' , '6' = '' , '7' = '' , '8' = '' , '9' = '' , na = '' }
local nums = {}
nums[0]="  " 
nums[1]="  "
nums[2]="  "
nums[3]="  "
nums[4]="  "
nums[5]="  "
nums[6]="  "
nums[7]="  "
nums[8]="  " 
nums[9]="  "
nums["na"]="  " 
  -- tmxs = {}
  -- trms = {}
  -- webs = {}
local items = {
    { "mtx", {}, thm.mtx_icon},
    { "trm", {}, thm.trm_icon},
    { "web", {}, thm.web_icon},
    { "etc", {}, thm.etc_icon}
 }
    -- { "vim", {}, thm.trm_icon},
  -- items = {}
  -- items.trms = {}
    -- { "etc", {}, thm.etc_icon }
      -- tmxs[#tmxs + 1] = item

-- un-minimize all urxvt instances
--[[
  local mtx_rule = function (c)
    return awful.rules.match(c, {instance = "MTX_MASTER"})
  end
  for c in awful.client.iterate(mtx_rule) do
    items[1][2][#items[1][2] + 1] = {
      c.name,
      function() c.first_tag:view_only() client.focus = c client.focus:raise() end,
      thm.mtx_icon
    }
  end
  local trm_rule = function (c)
    return awful.rules.match_any(c, { instance = { "kitty", "termite", "Alacritty" }, class ={ "kitty", "M_SYS_LOG" } })
  end
  for c in awful.client.iterate(trm_rule) do
    items[2][2][#items[2][2] + 1] = {
      c.name,
      function() c.first_tag:view_only() client.focus = c client.focus:raise() end,
      thm.trm_icon
    }
  end
  -- local vim_rule = function (c)
  --   return awful.rules.match_any(c, { instance = { "kitty", "termite", "Alacritty" }, class ={ "kitty", "M_SYS_LOG" } })
  -- end
  -- for c in awful.client.iterate(vim_rule) do
  --   items[2][2][#items[2][2] + 1] = {
  --     c.name,
  --     function() c.first_tag:view_only() client.focus = c client.focus:raise() end,
  --     thm.trm_icon
  --   }
  -- end
  local web_rule = function (c)
    return awful.rules.match_any(c, {{class={'Chromium'}}, {instance={'chromium'}}})
  end
  for c in awful.client.iterate(web_rule) do
    items[3][2][#items[3][2] + 1] = {
      c.name,
      function() c.first_tag:view_only() client.focus = c client.focus:raise() end,
      thm.web_icon
    }
  end
  local etc_rule = function (c)
    return awful.rules.match_any(c, { })
    -- return awful.rules.match(c, { rule={}, except_any = {instance={'chromium','kitty','MTX_MASTER'}}})
  end
  for c in awful.client.iterate(etc_rule) do
    items[#items + 1] = {
      c.name,
      function() c.first_tag:view_only() client.focus = c client.focus:raise() end,
      thm.etc_icon
    }
  end
]]

  for _, c in pairs(client.get()) do
    local item = {
      c.name,
      function() c.first_tag:view_only() client.focus = c client.focus:raise() end,
      thm.etc_icon
    }
      mdbg_p(c.name) mdbg_p(c.icon)
    if awful.rules.match_any(c, { instance = { "MTX_UNO", "MTX_MASTER" } }) then
        item[3]=thm.mtx_icon
        items[1][2][#items[1][2] + 1] = item
    elseif awful.rules.match_any(c, {
          instance = { "kitty", "termite", "Alacritty" },
          class ={ "kitty", "M_SYS_LOG" } }) then
        item[3]=thm.trm_icon
        items[2][2][#items[2][2] + 1] = item
    elseif awful.rules.match_any(c,
        {class={'Chromium'}},
        {instance={'chromium'}}
        ) then
        item[3]=thm.web_icon
        items[3][2][#items[3][2] + 1] = item
    else
      item[3]=thm.etc_icon
      if awful.rules.match(c, {class='Spotify'}) then item[3]=thm.spotify_icon end
      if awful.rules.match(c, {class='Steam'}) then item[3]=thm.steam_icon end
      if awful.rules.match(c, {class='Slack'}) then item[3]=thm.slack_icon end
      items[#items + 1] = item
    end
  end

-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

    -- i f awful.rules.match(c, {type='normal'}) then
      -- item = {c.name, function() c.first_tag:view_only() client.focus = c end, thm.etc_icon, theme = { fg_normal = thm.border_marked }}
      -- item = {c.name, function() c.first_tag:view_only() client.focus = c end, c.icon or thm.etc_icon}
      -- mdbg_t({icon=c.icon, sizes=c.icon_sizes}, "MICOOOOO " .. c.name)
        -- trms[#trms + 1] = item
      -- webs[#webs + 1] = item
      -- item.theme = { fg_normal = thm.border_marked }
      --
        -- items[3][2][#items[3][2] + 1] = item

    -- if awful.rules.match_any(c, { instance = { "kitty", "termite", "Alacritty", "MTX_UNO", "MTX_MASTER" },
    --     class ={ "kitty" }}
    --   ) then
    --   atrms[#trms + 1] = item
    -- end
    --

  if #items[1][2]==0 then items[1].theme = { submenu_icon=thm.menu_submenu_icon_empty, fg_normal = thm.fg_dark, fg_focus = thm.fg_dark } end
  if #items[2][2]==0 then items[2].theme = { submenu_icon=thm.menu_submenu_icon_empty, fg_normal = thm.fg_dark, fg_focus = thm.fg_dark } end
  if #items[3][2]==0 then items[3].theme = { submenu_icon=thm.menu_submenu_icon_empty, fg_normal = thm.fg_dark, fg_focus = thm.fg_dark } end

  items[1][1] = string.format('%s - %s', (nums[#items[1][2]] or nums.na), items[1][1])
  items[2][1] = string.format('%s - %s', (nums[#items[2][2]] or nums.na), items[2][1])
  items[3][1] = string.format('%s - %s', (nums[#items[3][2]] or nums.na), items[3][1])
  -- items[1] = { "tmx", tmxs, thm.webstorm_icon }
  -- items[2] = { "trm", trms, thm.webstorm_icon }
  -- items[3] = { "web", webs, thm.chromium_icon }
  -- mdbg_t({items=items}, 'GRID_MENU________')
  return awful.menu({items=items,
      theme = { 
        width = 900
        ,border_color = thm.border_normal 
      }
    }):show({coords = { x = 50, y = 50 } })
 -- awful.menu(terms)
end
-- /////////////////////////////////////// --
mmenus.all_menu = function ()
  awful.menu.client_list({ 
      theme = { 
        width = 800
        ,border_color = thm.border_normal 
      },
      coords = { x = 400, y = 800 } 
    })
end

return mmenus

-- 99='',
--
--
--
--
--
--
--
--
  -- %%   
  -- %%   
  -- %%   
  -- %%   
  -- %%   
  -- %%   
  -- %%   
  -- %%   
  -- %%   
  -- %%   
  -- %%   
  --
-- local dmenu_run    = "dmenu_run  -fn 'FiraMono Bold-22' -nb '#1b1c27' -nf '#707BC2' -sb '#000000' -sf '#b9f27c' -i"
