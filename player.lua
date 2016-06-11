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

function love.mousepressed(x, y, button, istouch)
    if button == "r" then
        if drawHUD == false then
            drawHUD = true
            Player.posX = x
            Player.posY = y
        else
            drawHUD = false
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