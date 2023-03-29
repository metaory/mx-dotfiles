local awful = require("awful")
local thm = require("beautiful")
local gears = require("gears")
local watch = require("awful.widget.watch")
local wibox = require("wibox")


local ramgraph_widget = {}


local function worker(user_args)
    local args = user_args or {}
    local timeout = args.timeout or 1
    local size = args.size or thm.arc_size or 28

    --- Main ram widget shown on wibar
    ramgraph_widget = wibox.widget {
        border_width = 0,
        colors = {
           thm.prpl_l, -- used
           thm.fg_dark  -- free
        },
        thickness = thm.arc_thickness,
        display_labels = false,
        forced_height = size * 2,
        forced_width = size * 2,
        -- widget = wibox.widget.arcchart
        widget = wibox.widget.piechart
    }

    --- Widget which is shown when user clicks on the ram widget
    local popup = awful.popup{
       ontop = true,
       visible = false,
       widget = {
          widget = wibox.widget.piechart,
          forced_height = 200,
          forced_width = 400,
          colors = {
             thm.bg_urgent,           -- used
             thm.fg_normal,           -- free
             thm.border_color_active, -- buf_cache
          },
       },
       shape = gears.shape.rounded_rect,
       border_color = thm.border_color_active,
       border_width = 1,
       offset = { y = 5 },
    }

    --luacheck:ignore 231
    local total, used, free, shared, buff_cache, available, total_swap, used_swap, free_swap

    local function getPercentage(value)
        return math.floor(value / (total+total_swap) * 100 + 0.5) .. '%'
    end

    watch('bash -c "LANGUAGE=en_US.UTF-8 free | grep -z Mem.*Swap.*"', timeout,
        function(widget, stdout)
            total, used, free, shared, buff_cache, available, total_swap, used_swap, free_swap =
                stdout:match('(%d+)%s*(%d+)%s*(%d+)%s*(%d+)%s*(%d+)%s*(%d+)%s*Swap:%s*(%d+)%s*(%d+)%s*(%d+)')

            widget.data = { used, total-used }

            if popup.visible then
               popup:get_widget().data_list = {
                  {'used ' .. getPercentage(used + used_swap), used + used_swap},
                  {'free ' .. getPercentage(free + free_swap), free + free_swap},
                  {'buff_cache ' .. getPercentage(buff_cache), buff_cache}
                }
            end
        end,
        ramgraph_widget
    )

    ramgraph_widget:buttons(
        awful.util.table.join(
           awful.button({}, 1, function()
                 popup:get_widget().data_list = {
                    {'used ' .. getPercentage(used + used_swap), used + used_swap},
                    {'free ' .. getPercentage(free + free_swap), free + free_swap},
                    {'buff_cache ' .. getPercentage(buff_cache), buff_cache}
                }

                if popup.visible then
                   popup.visible = not popup.visible
                else
                   popup:move_next_to(mouse.current_widget_geometry)
                end
            end)
        )
    )

    return ramgraph_widget
end


return setmetatable(ramgraph_widget, { __call = function(_, ...)
    return worker(...)
end })
