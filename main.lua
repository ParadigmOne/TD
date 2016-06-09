require "entity"
require "board"
require "player"

function love.load()
	Enemy.findPath()
	Enemy.spawnNew()
end


function love.update(dt)
	Enemy.update()
end

function love.draw()
    map.draw()
	Enemy.draw()
end