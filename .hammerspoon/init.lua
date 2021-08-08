-- Redeye ----------
function redden()
    gamma = hs.screen.primaryScreen():getGamma()
    descending, ascending = gamma['whitepoint']['green'], gamma['blackpoint']['red']
    while descending > hs.battery.percentage() / 10 do
        for key, screen in pairs(hs.screen.allScreens()) do
            screen:setGamma({red=1, green=descending, blue=descending}, {red=ascending})
            ascending = ascending + .005
            descending = descending - .005
        end
    end
end

hs.battery.watcher.new( function()
    if (hs.battery.percentage() < 10.0) and (not hs.battery.isCharging()) then
        redden()
    else
        hs.screen.restoreGamma()
    end
end):start()
-- end Redeye ------


hs.hotkey.bind({'cmd', 'alt'}, 'c', function() 
  hs.notify.new({title="Hammerspoon", informativeText="Hello World"}):send()
end)
