--turret
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

function Turret:setXY(x, y)
    Turret:setX(x)
    Turret:setY(y)
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

       