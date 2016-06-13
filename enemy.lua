--enemy

Enemy = {}
startX = nil
startY = nil


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
		
		
			
		if map[tileY][tileX-1] == 9 and v.direction ~= "right" then --left
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


function Enemy.drawDebug()
	love.graphics.setColor(0,255,0)
	love.graphics.print(tileX,0,160)
	love.graphics.print(tileY,20,160)
	love.graphics.print(#Enemy, 0,0)
	love.graphics.print(round(Enemy[1].posX/32)+1, 60,0)
	love.graphics.print(Enemy[1].posY/32+1, 60, 20)
	love.graphics.setColor(0,0,255)
end
