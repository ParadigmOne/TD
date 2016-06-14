--enemy

Enemy = {}
startX = nil
startY = nil
wave = {
	number = 0,
	enemiesToSpawn = 0,
	spawnTimer = 50
}
waveButton = {
	x = 700,
	y = 550,
	width = 80,
	height = 40
}
function beginWave()
	wave.number = wave.number+1
	wave.enemiesToSpawn = 3*wave.number
end

function Enemy.spawnNew()
	if startX == nil then
		for i, v in ipairs(map) do
			for j, v in ipairs(map[i]) do
				if v == 2 then
					startX = j
					startY = i
				end
			end
		end
	end
	
	newEnemy = 
	{
		hp = 10,
		posX = (startX-1)*32,
		posY = (startY-1)*32,
		direction = nil
	}
	table.insert(Enemy, newEnemy)
end
--test
function Enemy.update()
	if wave.enemiesToSpawn > 0 then
		wave.spawnTimer = wave.spawnTimer - 1 
		if wave.spawnTimer <= 0 then 
			Enemy.spawnNew()
			wave.enemiesToSpawn = wave.enemiesToSpawn-1 
			wave.spawnTimer = 50
		end
	end

	for i, v in ipairs(Enemy) do
		local yoffset = 0
		local xoffset = 0
		if v.direction == "up" then
			yoffset = 32
		elseif v.direction == "down" then
			yoffset = 0
		elseif v.direction == "left" then
			xoffset = 32
		elseif v.direction == "right" then
			xoffset = 0
		end
		
		tileX = round((v.posX+xoffset)/32)+1
		tileY = round((v.posY+yoffset)/32)+1
		
				
		if map[tileY][tileX-1] == 9 and v.direction ~= "right" and v.posY == tileY*32 then --left
			v.posX = v.posX - 1
			v.direction = "left"
		elseif map[tileY][tileX+1] == 9 and v.direction ~= "left" then -- right
			v.posX = v.posX + 1
			v.direction = "right"
		elseif map[tileY-1][tileX] == 9 and v.direction ~= "down" then --up
			v.posY = v.posY - 1 
			v.direction = "up"
		elseif map[tileY+1][tileX] == 9 and v.direction ~= "up" then 
			v.posY = v.posY + 1 
			v.direction = "down"
		end
		
		
		if map[tileY][tileX-1] == 3 or map[tileY][tileX+1] == 3 or map[tileY-1][tileX] == 3 or map[tileY+1][tileX] == 3 then
			Player.damage(3)
			table.remove(Enemy, i)
		end	
	end

end


function Enemy.draw()
	love.graphics.setColor(255,150,150)
	for i, v in ipairs(Enemy) do
		love.graphics.rectangle("fill", v.posX, v.posY, 32,32)
	end
	Enemy.drawDebug()
end

function Enemy.damage(enemy)
	if Enemy[enemy].hp <= 0 then
		table.remove(Enemy, enemy)
	end
end

function waveButton.draw()
	love.graphics.setColor(255,255,255)
	love.graphics.rectangle("line", waveButton.x, waveButton.y, waveButton.width, waveButton.height)
	love.graphics.setColor(0,0,100)
	love.graphics.rectangle("fill", waveButton.x+2, waveButton.y+2, waveButton.width-4, waveButton.height-4)
	love.graphics.setColor(255,255,255)
	love.graphics.print("Begin Wave", waveButton.x+4, waveButton.y+3)
	love.graphics.print(wave.number+1, waveButton.x+35, waveButton.y+22)
end 

function Enemy.drawDebug()
	love.graphics.setColor(0,255,0)
	love.graphics.print(#Enemy, 0,0)
	love.graphics.print(wave.number,0,20)
	love.graphics.print(wave.enemiesToSpawn, 20,20)
	love.graphics.print(wave.spawnTimer,40,20)
	love.graphics.setColor(0,0,255)
end
