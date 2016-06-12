--entity

Enemy = {}
Path = {}

function Enemy.findPath()
end

function Enemy.spawnNew()
local newPosX = 0
local newPosY = 0
local newDestinationX = 0
local newDestinationY = 0
	
	for i, v in ipairs(map) do
		for j, v in ipairs(map[i]) do
			if v == 2 then
				newPosY = (i-1)*32
				newPosX = (j-1)*32 
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
--test
function Enemy.update()
local tileX = 0
local tileY = 0 

	for i, v in ipairs(Enemy) do
		tileX = round((v.posX/32))+1
		tileY = round((v.posY/32))+1
		
		if map[tileY][tileX+1] == 9 then
			v.posX = v.posX + 1
		elseif map[tileY+1][tileX] == 9 then
			v.posY = v.posY + 1
		elseif map[tileY][tileX-1] == 9 then
			v.posX = v.posX - 1
		elseif map[tileY-1][tileX] == 9 then
			v.posY = v.posY - 1
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
	love.graphics.print(Enemy[1].posX/32+1, 60,0)
	love.graphics.print(Enemy[1].posY/32+1, 60, 20)
	love.graphics.setColor(0,0,255)
end

Turret = {}
Turret.__index = Turret

function Turret.new(x, y, tType)
  local turret = {}
  setmetatable(turret, Turret)
  turret.posX = x
  turret.posY = y
  turret.tType = tType
  return turret
end

function Turret:setX(x)
  self.posX = x
end

function Turret:setY(y)
  self.posY = y
end

function Turret:getX()
  return self.posX
end

function Turret:getY()
  return self.posY
end

function Turret:getType()
  return self.tType
end

function Turret:copy(obj)
  local newTurret = {}
  setmetatable(newTurret, Turret)
  newTurret.posX = obj.posX
  newTurret.posY = obj.posY
  newTurret.tType = obj.tType
  return newTurret
end

function Turret:Draw(x, y)
    --set the x and y position
    self.posX = x
    self.posY = y
    if self.tType == "Slow" then
        love.graphics.setColor(146,232,169)
    elseif self.tType == "AoE" then
        love.graphics.setColor(153,0,201)
    else
        love.graphics.setColor(130,210,245)
    end
    
    love.graphics.rectangle("fill", self.posX, self.posY, 32, 32)    
end

       