--player

Player = {
			HP,
			cash,
            posX,
            posY,
			dead,
            turret
         }
         
ActiveTurrets = {}
function Player.update(dt)
	if Player.dead == true then 
		deathTimer = deathTimer-1 
		if deathTimer <= 0 then
			love.graphics.setNewFont(12)
			Player.dead = false
		end
	end
end


function Player.damage(dmg)
	Player.HP = Player.HP - dmg
	if Player.HP <= 0 then
		wave.number = 0
		wave.enemiesToSpawn = 0 
		wave.spawnTimer = 5
		deathTimer = 200
		for i, v in ipairs(Enemy) do
			table.remove(Enemy, i) 
		end 
		Player.dead = true
	end
end

function Player.draw()
    if drawHUD then
        hudTurrets.drawAllHud()
    elseif drawOne then
        hudTurrets.drawOne(love.mouse.getX() - 16, love.mouse.getY() - 16)
    elseif drawTwo then
        hudTurrets.drawTwo(love.mouse.getX() - 16, love.mouse.getY() - 16)
    elseif drawThree then
        hudTurrets.drawThree(love.mouse.getX() - 16, love.mouse.getY() - 16)
    end
	
	
	--hit points
	love.graphics.setColor(255,255,255)
	love.graphics.rectangle("line", 10,love.graphics.getHeight()-50,500,30)
	love.graphics.setColor(150,0,0)
	love.graphics.rectangle("fill", 11, love.graphics.getHeight()-48, (Player.HP/100)*498, 27)
	love.graphics.setColor(255,255,255)
	love.graphics.print(Player.HP .. "/100", 230 , love.graphics.getHeight()-40)
    
    
    --active turrets
    for i, v in ipairs(ActiveTurrets) do
        ActiveTurrets[i]:Draw(ActiveTurrets[i]:getX(), ActiveTurrets[i]:getY())
    end
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
    
    --now be able to place it
    elseif button == "l" then
        if drawOne == true then
            hudTurrets.one:setXY(x, y)
            hudTurrets.one:setActive(true)
            table.insert(ActiveTurrets, hudTurrets.one:copy(hudTurrets.one))
            drawOne = false
        elseif drawTwo == true then
            hudTurrets.two:setXY(x, y)
            hudTurrets.two:setActive("true")
            table.insert(ActiveTurrets, hudTurrets.two:copy(hudTurrets.two))
            drawTwo = false
        elseif drawThree == true then
            hudTurrets.three:setXY(x, y)
            hudTurrets.three:setActive("true")
            table.insert(ActiveTurrets, hudTurrets.three:copy(hudTurrets.three))
            drawThree = false
        end
    end
end

function love.mousereleased(x, y, button, istouch)
	if checkCollision(waveButton.x, waveButton.y, waveButton.width, waveButton.height,x,y,1,1) then 
		beginWave()
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