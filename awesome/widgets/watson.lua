local awful = require("awful")
local watch = require("awful.widget.watch")
local wibox = require("wibox")


local watson_widget wibox.widget {
    markup = 'This <i>is</i> a <b>textbox</b>!!!',
    align  = 'left',
    valign = 'center',
    widget = wibox.widget.textbox
}


--- Widget which is shown when user clicks on the ram widget
local total, used, free, shared, buff_cache, available

watch('bash -c "free | grep Mem"', 1,
    function(widget, stdout, stderr, exitreason, exitcode)
        total, used, free, shared, buff_cache, available = stdout:match('(%d+)%s*(%d+)%s*(%d+)%s*(%d+)%s*(%d+)%s*(%d+)')
        widget.data = { used, total-used }

    end,
    watson_widget
)


return watson_widget
