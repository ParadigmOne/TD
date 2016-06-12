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
        hudTurrets.drawAllHud()
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
use:            mouse press for the hud/placing turrets
]]--

-- keep track of mouse clicks
drawHUD = false

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

    end
end


hudTurrets = {
                  one = Turret.new(0,0,"Slow"),
                  two = Turret.new(0,0,"AoE"),
                  three = Turret.new(0,0,"PewPew"),
              }
              
function hudTurrets.drawAllHud()
    hudTurrets.drawOne()
    hudTurrets.drawTwo()
    hudTurrets.drawThree()
end          
function hudTurrets.drawOne()
    hudTurrets.one.Draw()
end
function hudTurrets.drawTwo()
    hudTurrets.two.Draw()
end
function hudTurrets.drawThree()
    hudTurrets.three.Draw()
end

--collision detection
function checkCollision(x1, y1, w1, h1, x2, y2, w2, h2)
  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end