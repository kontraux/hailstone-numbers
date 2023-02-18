local world = {}
local collatz = require 'collatz'

local n = 4
local t = collatz.run(n)

local screenwidth, screenheight = love.graphics.getWidth(), love.graphics.getHeight()

local function highest(t)
    local n = 1
    for i,v in pairs(t) do
        if v > n then n = v end
    end
    return n
end

local sx, sy
local time = 0
function world.update(dt)
    time = time + dt
    if time >= 1 then
        n = n + 1
        time = 0
        t = collatz.run(n)
    end
    sx = (#t / screenwidth)
    sy = (highest(t) / screenheight)
end

local margin = 5
function world.draw()
    local str = 'Current seed: ' .. n
    love.graphics.print(str)
    for x = 1, #t do
        love.graphics.circle('fill',  (x / sx), (screenheight - (t[x] / sy)), 5)
        love.graphics.print(t[x],  (x / sx) + margin, (screenheight - (t[x] / sy) + margin))

    end
end


return world