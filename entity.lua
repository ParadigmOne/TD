--entity

EnemiesOnScreen = {}

function spawnNew()

	newEnemy = {
		hp = 10,
		
		for i, v in ipairs(map) do
			for j, v in ipairs(map[i]) do
				if v == 2 then
					newEnemy.posX = i*32
					newEnemy.posY = j*32
				end
			end		
		end
	}
	table.insert(EnemiesOnScreen, newEnemy)
end

function updateMobs()
	for i, v in ipairs(EnemiesOnScreen) do
		-- till the map is there
		v.posX = v.posX + 5
	end
end


function drawMobs()
	love.graphics.setColor(255,150,150)
	for i, v in ipairs(EnemiesOnScreen) do
		love.graphics.rectangle("fill", v.posX, v.posY, 32,32)
	end
end

function killEnemy(enemy)
	if EnemiesOnScreen[enemy].hp <= 0 then
		table.remove(EnemiesOnScreen, enemy)
	end
end

