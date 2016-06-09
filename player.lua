--player

Player = {
            posX
            posY
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
end
       
--[[
function:   player.rightClick()
use:        display available turret types if it was right clicked
]]--        
 
function Player.rightClick()

end

--[[
function:       love.mousepressed(x, y, button, istouch)
use:            
]]--

-- keep track of mouse clicks
local drawHUD = false

function love.mousepressed(x, y, button, istouch)
    if button == 1 then
        if drawHUD == false
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
]]--
function Player.drawHUD(x, y)
    
end