require "turret"
require "enemy"
require "board"
require "player"

function love.load()
	--beginWave()
	Player.HP = 100
	Player.dead = false
end


function love.update(dt)
	if Player.dead == false then
		Enemy.update()
	end
	Player.update()
end

function love.draw()
    if Player.dead == false then
		map.draw()
		Enemy.draw()
		waveButton.draw()
		Player.draw()
	elseif Player.dead == true then 
		love.graphics.setNewFont(32)
		love.graphics.setColor(255,0,0)
		love.graphics.print("YOU DIED", love.graphics.getWidth()/2 - 90 ,love.graphics.getHeight()/2-20)
	end

end

function round(number)
	return number - (number % 1)
end

