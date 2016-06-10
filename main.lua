require "entity"
require "board"
require "player"

function love.load()
	Enemy.spawnNew()
end


function love.update(dt)
	Enemy.update()
end

function love.draw()
    map.draw()
	mapdebug()
	Enemy.draw()
end

function mapdebug()
	love.graphics.setColor(255,100,0)
	for i, v in ipairs(map) do
		for j, v in ipairs(map[i]) do
			love.graphics.print(j, (j-1)*32, (i-1)*32)
			love.graphics.print(i, (j-1)*32, ((i-1)*32)+12)
		end
	end
end

function round(number)
	return number - (number % 1)
end