require "turret"
require "enemy"
require "board"
require "player"

function love.load()
	--beginWave()
	Player.HP = 100
end


function love.update(dt)
	Enemy.update()
end

function love.draw()
    map.draw()
	Enemy.draw()
	waveButton.draw()
	Player.draw()

end

function round(number)
	return number - (number % 1)
end

