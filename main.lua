require "entity"
require "board"

function love.load()
	Enemy.spawnNew()
end


function love.update(dt)
end

function love.draw()
    map.draw()
	Enemy.draw()
end