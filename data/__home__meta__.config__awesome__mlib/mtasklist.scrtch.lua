
-- s.zztasklist = awful.widget.tasklist {
--   screen = s,
--   filter = m_filter_mtx,
--   buttons = tasklist_buttons,
--   layout   = {
--     spacing = 10,
--     spacing_widget = {
--       { forced_width = 2, color = beautiful.xshade_2, shape        = gears.shape.rectangle, widget       = wibox.widget.separator },
--       valign = 'center', halign = 'center',content_fill = true, fill = true,  widget = wibox.container.place,
--     }, layout  = wibox.layout.flex.horizontal,
--   },
-- }
-- s.mytxbox = awful.wibar({
--     position = "top",
--     screen = s,
--     optop = true,
--   })
-- s.mytxbox:setup {
--   layout = wibox.layout.align.horizontal,
--   ontop = true,
--   mysepx,
--   s.zztasklist,
--   {
--     layout = wibox.layout.fixed.horizontal,
--     mysep,
--     mysepx,
--   },
-- }
--
