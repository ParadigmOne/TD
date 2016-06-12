--player

Player = {
            posX,
            posY,
            turret
         }
         
--[[
function:    player.update(dt)
use:        collect all the player movement things to add into
            love.update(dt)
]]--
function Player.update(dt)

end

--[[
function:    player.draw()
use:        collect all the player draw functions to add into
            love.draw()
]]--
function Player.draw()
    if drawHUD then
        Player.drawHUD(Player.posX, Player.posY)
    end
    if tType ~= 0 then
        drawSelected(tType)
    end
		love.graphics.setColor(0,255,0)
	love.graphics.print(tostring(drawHUD), 0,60)
end
       
--[[
function:   player.rightClick()
use:        display available turret types if it was right clicked
]]--        
 
function Player.rightClick()

end

--[[
function:       love.mousepressed(x, y, button, istouch)
use:            mouse press for the hud/placing turrets
]]--

-- keep track of mouse clicks
drawHUD = false
tType = 0

function love.mousepressed(x, y, button, istouch)
--make the hud show up
    if button == "r" then
        if drawHUD == false then
            drawHUD = true
            Player.posX = x
            Player.posY = y
        else
            drawHUD = false
        end
--select the turret
    elseif button == "l" and drawHUD then
    --for the turrets
        if checkCollision(Player.posX, Player.posY, 32, 32, hudTurrets[1].posX, hudTurrets[1].posY, 32, 32) then
            tType = 1
        elseif checkCollision(Player.posX, Player.posY, 32, 32, hudTurrets[2].posX, hudTurrets[2].posY, 32, 32) then
            tType = 2
        else
            tType = 3
        end
    end
end

--[[
function:   player.drawHUD()
use:        draw's the players nonsense at x, y where player clicked
arguments:  x and y coordinate for where the turrets will be drawn
]]--

hudTurrets = {}
--storage for the hud turrets
function HudLoad()
    for i = 1, 3 do
        Turret.posX = 0
        Turret.posY = 0
        Turret.turretType = i
        newTurret = {
            posX = Turret.posX,
            posY = Turret.posY, 
            turretType = Turret.turretType
        }
        table.insert (hudTurrets, newTurret)
    end
end
             
function Player.drawHUD(x, y)
    for i = 1, 3 do
        hudTurrets[i].posX = x + ((i-1) * 32)
        hudTurrets[i].posY = y
    end
    drawTurret(hudTurrets)
end

function drawSelected(tType)
    drawTurret(tType)
end

--collision detection
function checkCollision(x1, y1, w1, h1, x2, y2, w2, h2)
  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end