--entity

Enemy = {}

function Enemy.spawnNew()
local newPosX = 0
local newPosY = 0
	
	for i, v in ipairs(map) do
		for j, v in ipairs(map[i]) do
			if v == 2 then
				newPosX = i*32
				newPosY = j*32 
			end
		end
	end

	newEnemy = {
		hp = 10,
		posX = newPosX,
		posY = newPosY
	}
	table.insert(Enemy, newEnemy)
end
--test
function Enemy.update()
	for i, v in ipairs(Enemy) do
		-- till the map is there
		v.posX = v.posX + 5
	end
end


function Enemy.draw()
	love.graphics.setColor(255,150,150)
	for i, v in ipairs(Enemy) do
		--love.graphics.rectangle("fill", v.posX, v.posY, 32,32)
	end
	Enemy.drawDebug()
end

function Enemy.kill(enemy)
	if Enemy[enemy].hp <= 0 then
		table.remove(Enemy, enemy)
	end
end


function Enemy.drawDebug()
	love.graphics.setColor(0,255,0)
	love.graphics.print(#Enemy, 0,0)
	for i, v in ipairs(Enemy) do
	end
end


--TURRET ENTITYS--
Turret = {
            posX
            posY
            turretType
            --turret types are slow, aoe, pewpewpew
         }
   
   
function drawTurret()
end
       
