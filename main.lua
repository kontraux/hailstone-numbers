local world = require 'world'

function love.load()
end

function love.update(dt)
    world.update(dt)
end

function love.draw()
    world.draw()
end