-- TODO
-- Known issues w/ redeye:
-- - hs.battery.watcher events don't seem to fire when isCharging() changes, so the outer else case isn't hit instantaneously
-- - iirc, I once closed my screen when it was in redeye and began charging. When I returned, charge was > 10, but gamma hadn't been restored yet - this might be an issue similar to the above with the battery watcher.
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
