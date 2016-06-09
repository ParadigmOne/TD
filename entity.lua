--entity

Enemy = {}
Path = {}

function Enemy.findPath()
local startPoint = {0, 0}
local endPoint = {0, 0}
local startFound = false
local endFound = false

	for i, v in ipairs(map) do 
		for j, v in ipairs(map[i]) do
			if v == 2 then
				startPoint = {i, j}
				endFound = true
			elseif v == 3 then
				endPoint = {i, j}
				endFound = true
			end
		end
	end


end

function Enemy.spawnNew()
local newPosX = 0
local newPosY = 0
local newDestinationX = 0
local newDestinationY = 0
	
	for i, v in ipairs(map) do
		for j, v in ipairs(map[i]) do
			if v == 2 then
				newPosX = (i-1)*32
				newPosY = (j-1)*32 
			elseif v == 3 then
				newDestinationX = (j-1)*32
				newDestinationY = (i-1)*32
			end
		end
	end

	newEnemy = {
		hp = 10,
		posX = newPosX,
		posY = newPosY,
		destinationX = newDestinationX,
		destinationY = newDestinationY
	}
	table.insert(Enemy, newEnemy)
end

function Enemy.update()
	for i, v in ipairs(Enemy) do
		if v.posX < v.destinationX then
			v.posX = v.posX + 2
		end
		if v.posY < v.destinationY then
			v.posY = v.posY + 2
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

function Enemy.kill(enemy)
	if Enemy[enemy].hp <= 0 then
		table.remove(Enemy, enemy)
	end
end


function Enemy.drawDebug()
	love.graphics.setColor(0,255,0)
	love.graphics.print(#Enemy, 0,0)
	for i, v in ipairs(Enemy) do
		love.graphics.print(v.posX, 20,0)
		love.graphics.print(v.posY, 20, 12)
		love.graphics.print(v.destinationX, 70, 0)
		love.graphics.print(v.destinationY, 70, 12)
	end
end
