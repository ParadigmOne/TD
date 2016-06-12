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
    elseif drawOne then
        hudTurrets.drawOne(Player.posX, Player.posY)
    elseif drawTwo then
        hudTurrets.drawTwo(Player.posX, Player.posY)
    elseif drawThree then
        hudTurrets.drawThree(Player.posX, Player.posY)
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
        end
--select the turret
    elseif button == "l" and drawHUD then
    --check for one
        if checkCollision(hudTurrets.one:getX(), hudTurrets.one:getY(), 32, 32, x, y, 1, 1) then
            drawOne = true
            drawHUD = false
        elseif checkCollision(hudTurrets.two:getX(), hudTurrets.two:getY(), 32, 32, x, y, 1, 1) then
            drawTwo = true
            drawHUD = false
        elseif checkCollision(hudTurrets.three:getX(), hudTurrets.three:getY(), 32, 32, x, y, 1, 1) then
            drawThree = true
            drawHUD = false
        end
    end
end

drawOne = false
drawTwo = false
drawThree = false
hudTurrets = {
                  one = Turret.new(0,0,"Slow"),
                  two = Turret.new(0,0,"AoE"),
                  three = Turret.new(0,0,"PewPew"),
              }
              
function hudTurrets.drawAllHud()
    hudTurrets.drawOne(Player.posX, Player.posY)
    hudTurrets.drawTwo(Player.posX + 32, Player.posY)
    hudTurrets.drawThree(Player.posX + 64, Player.posY)
end          
function hudTurrets.drawOne(x, y)
    hudTurrets.one:Draw(x, y)
end
function hudTurrets.drawTwo(x, y)
    hudTurrets.two:Draw(x, y)
end
function hudTurrets.drawThree(x, y)
    hudTurrets.three:Draw(x, y)
end

--collision detection
function checkCollision(x1, y1, w1, h1, x2, y2, w2, h2)
  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end