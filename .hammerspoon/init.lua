function redeye()
    if (hs.battery.percentage() < 10.0) and (not hs.battery.isCharging()) then
        gamma = hs.screen.primaryScreen():getGamma()
        descending, ascending = gamma['whitepoint']['green'], gamma['blackpoint']['red']
        while descending > hs.battery.percentage() / 10 do
            for key, screen in pairs(hs.screen.allScreens()) do
                screen:setGamma({red=1, green=descending, blue=descending}, {red=ascending})
                ascending = ascending + .005
                descending = descending - .005
            end
        end
    else
        hs.screen.restoreGamma()
    end
end

hs.battery.watcher.new( redeye ):start()

hs.hotkey.bind({'cmd', 'alt'}, 'R', function() 
    hs.screen.restoreGamma()
end)

hs.hotkey.bind({'cmd'}, 'return', function()
    notes = hs.application('Notes')
    hs.application.launchOrFocus('Notes')
    delay = notes == nil and .05 or 0
    hs.timer.delayed.new(delay, function()
        hs.eventtap.keyStroke({'⌥', 'cmd'}, 'F')
    end):start()
end)
