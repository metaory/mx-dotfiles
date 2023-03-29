-- mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon, menu = mymainmenu })
 -- mySeparatorWidget = wibox.widget { widget = wibox.widget.separator }
--  mySeparatorWidget = wibox.widget {
--     shape        = gears.shape.circle,
--     color        = '#00000000',
--     forced_with  = 20,
--     border_width = 1,
--     border_color = beautiful.bg_normal,
--     widget       = wibox.widget.separator,
-- }
-- mySeparatorWidget = wibox.widget.textclock()
-- mySeparatorWidget = wibox.widget{ markup = ' ', widget = wibox.widget.textbox }

-- mySeparatorWidget = wibox.widget.separator({ forced_with  = 20, })
  -- Primary tasklist widget
  s.mytasklist = awful.widget.tasklist {
    screen = s,
    filter = meta_filter_currenttags,
    buttons = tasklist_buttons,
    style    = {
      -- spacing              = beautiful.tsklist_spacing,
      -- plain_task_name      = beautiful.tsklist_plain_task_name,
      -- disable_icon         = beautiful.tsklist_disable_icon,
      -- align                = beautiful.tsklist_align,
      -- sticky               = beautiful.tsklist_sticky,
      -- above                = beautiful.tsklist_above,
      -- ontop                = beautiful.tsklist_ontop,
      -- below                = beautiful.tsklist_below,
      -- floating             = beautiful.tsklist_floating,
      -- maximized            = beautiful.tsklist_maximized,
      -- maximized_horizontal = beautiful.tsklist_maximized_horizontal,
      -- maximized_vertical   = beautiful.tsklist_maximized_vertical,
      -- font                 = beautiful.tsklist_font,
      -- font_focus           = beautiful.tsklist_font_focus,
      -- bg_normal            = beautiful.tsklist_bg_normal,
      -- fg_normal            = beautiful.tsklist_fg_normal,
      -- bg_minimize          = beautiful.tsklist_bg_minimize,
      -- fg_minimize          = beautiful.tsklist_fg_minimize,
      -- bg_urgent            = beautiful.tsklist_bg_urgent,
      -- fg_urgent            = beautiful.tsklist_fg_urgent,
      -- bg_focus             = beautiful.tsklist_bg_focus,
      -- fg_focus             = beautiful.tsklist_fg_focus,
      -- shape                = beautiful.tsklist_shape,
      -- shape_focus          = beautiful.tsklist_shape_focus,
    },
    layout   = {
      spacing = 10,
      spacing_widget = {
        {
          forced_width = 10,
          shape        = gears.shape.circle,
          widget       = wibox.widget.separator
        },
        valign = 'center',
        halign = 'center',
        widget = wibox.container.place,
      },
      layout  = wibox.layout.flex.horizontal
    },
    widget_template = {
      {
        {
          {
            {
              id     = 'icon_role',
              widget = wibox.widget.imagebox,
            },
            margins = 2,
            widget  = wibox.container.margin,
          },
          {
            id     = 'text_role',
            widget = wibox.widget.textbox,
          },
          -- layout = wibox.layout.fixed.horizontal,
          layout = wibox.layout.align.horizontal,
          
        },
        left  = 10,
        right = 10,
        widget = wibox.container.margin
      },
      id     = 'background_role',
      widget = wibox.container.background,
    },

  }


  -- ###########################3
  -- ###########################3
  -- ###########################3
  -- ###########################3
 local capi = { screen = screen, client = client }
  -- ###########################3
 local function get_screen(s) return s and screen[s] end
  -- ###########################3
 function meta_filter_current_etc(c, screen)
   screen = get_screen(screen) -- Only print client on the same screen as this widget
   if get_screen(c.screen) ~= screen then return false end -- Include sticky client too
   if c.sticky then return true end
   local tags = screen.tags
   for _, t in ipairs(tags) do
     if t.selected then
       local ctags = c:tags()
       for _, v in ipairs(ctags) do
         if v == t then
           return not awful.rules.match_any(c, { instance = {"MTX_MASTER", "MTX_SLAVE"}})
         end
       end
     end
   end
   return false
 end

 function meta_filter_current_tmx(c, screen)
   screen = get_screen(screen) -- Only print client on the same screen as this widget
   if get_screen(c.screen) ~= screen then return false end -- Include sticky client too
   local cls = s.all_clients
   for c in ipairs(cls) do
     return  awful.rules.match_any(c, { instance = {"MTX_MASTER", "MTX_SLAVE"}})
   end
 end
  -- ###########################3
 s.etctasklist = awful.widget.tasklist {
   screen = s,
   filter = meta_filter_current_etc,
   -- filter = awful.widget.tasklist.filter.currenttags,
   buttons = tasklist_buttons,
}
  -- ###########################3
 s.tmxtasklist = awful.widget.tasklist {
   screen = s,
   filter = meta_filter_current_tmx,
   -- filter = awful.widget.tasklist.filter.currenttags,
   buttons = tasklist_buttons,
}
  
  -- ###########################3
  -- Add widgets to the wibox
  s.mywibox:setup {
    layout = wibox.layout.align.horizontal,
    { --[[ Left widgets ]]
      layout = wibox.layout.fixed.horizontal,
      s.mytaglist,
      mySeparatorWidget,
      -- mylauncher,
      s.spawnPromptWidget,
    },
    s.tmxtasklist,
    s.etctasklist, --[[ Middle widget ]]

    {  --[[ Right widgets ]]
      layout = wibox.layout.fixed.horizontal,
      -- mykeyboardlayout,
      mysystray,
      myassault,
      mytextclock,
      s.mylayoutbox,
    },
  }
  -- border_color = beautiful.taglist_fg_empty, border_width = 1, shape_border_width= 9,
local mysepz = { forced_width = 2, color = beautiful.xshade_2, shape        = gears.shape.rectangle, widget       = wibox.widget.separator }

-- filter = awful.widget.tasklist.filter.currenttags,

  

  -- s.myzibox = awful.wibar({ position = "bottom", screen = s, opacity = 0.8, height = 20 })

  -- Add widgets to the wibox
  -- mySeparatorWidget = wibox.widget.separator({ forced_width = 8, shape= gears.shape.rectangle})
--     widget_template = { { { { { id     = 'icon_role', widget = wibox.widget.imagebox, }, margins = 2, widget  = wibox.container.margin, }, { id     = 'text_role', widget = wibox.widget.textbox, }, layout = wibox.layout.fixed.horizontal, }, left  = 10, right = 10, widget = wibox.container.margin }, id     = 'background_role', widget = wibox.container.background, },

    -- widget_template = {
    --   {
    --     {
    --       -- { { id     = 'icon_role', widget = wibox.widget.imagebox, }, margins = 2, widget  = wibox.container.margin, },
    --       {
    --         id     = 'text_role',
    --         -- widget = wibox.widget.textbox,
    --         widget_template ={
    --         id     = 'text_role', align  = 'center', valign = 'center', widget = wibox.widget.textbox, }, widget = { markup = 'This <i>is</i> a <b>textbox</b>!!!', widget = wibox.widget.textbox }
    --       },
    --       -- forced_width = 10,
    --       -- max_widget_size = 100,
    --       layout = wibox.layout.flex.horizontal,
    --     },
    --     left  = 10,
    --     right = 10,
    --     widget = wibox.container.margin
    --   },
    --   id     = 'background_role',
    --   widget = wibox.container.background,
    -- },
    
    --
    -- max_widget_size = 100,
    -- forced_width = 100,

  -- s.myzibox:setup {
  --     layout = wibox.layout.fixed.horizontal,
  --     {
  --       layout = wibox.layout.fixed.horizontal,
  --       s.mytmx_tasklist,
  --       mysep,
  --     },
  -- }
  
function meta_filter_cur_tmx_tags(c, screen)
    screen = get_screen(screen) -- Only print client on the same screen as this widget
    if get_screen(c.screen) ~= screen then return false end -- Include sticky client too
    if awful.rules.match_any(c, { instance = {"MTX_MASTER", "MTX_SLAVE", "MTX_UNO"}}) then return false end
    if c.sticky then return true end

    local tags = screen.tags
    for _, t in ipairs(tags) do
        if t.selected then
            local ctags = c:tags()
            for _, v in ipairs(ctags) do
                if v == t then
                    return awful.rules.match_any(c, { instance = {"MTX_MASTER", "MTX_SLAVE", "MTX_UNO"}})
                end
            end
        end
    end
    return false
end
s.mycur_tmx_tasklist = awful.widget.tasklist {
  screen = s,
  filter = meta_filter_cur_tmx_tags, -- filter = awful.widget.tasklist.filter.currenttags,
  buttons = tasklist_buttons,
  style = {
    fg_focus  = '#000000',
    bg_focus  = beautiful.prpl_l  ,
    bg_normal = beautiful.bg_focus,
    fg_normal = beautiful.taglist_fg_empty,
    shape_border_width_focus = 0,
    shape_border_width = 0,
    shape= gears.shape.rectangle,
    shape_focus = gears.shape.rectangle,
    font = beautiful.font_larger, 
    font_focus = beautiful.font_larger, 
  },
  layout   = { spacing = 5, layout  = wibox.layout.flex.horizontal, },
  widget_template = {
    {
      { { id     = 'text_role', widget = wibox.widget.textbox, }, layout = wibox.layout.fixed.horizontal, },
      forced_width = 40, max_widget_size = 40, left  = 8, widget = wibox.container.margin
    }, id= 'background_role', widget = wibox.container.background,
  },
}

