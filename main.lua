require "entity"
require "board"
require "player"

function love.load()
	Enemy.spawnNew()
	HudLoad()
end


function love.update(dt)
	Enemy.update()
end

function love.draw()
    map.draw()
	Enemy.draw()
	Player.draw()
turretdebug()
end

function round(number)
	return number - (number % 1)
end

