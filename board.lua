--map

map = {
        {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
        {1,0,9,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,9,9,9,9,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,9,9,9,9,0,9,9,9,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,9,0,9,0,9,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,9,9,9,0,9,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,9,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,9,9,9,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,9,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,9,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,9,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,9,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,9,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,9,9,9,9,9,9,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,9,3,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
}



--[[
function:    map.draw()
use:        draw squares (32 x 32 pixels on the screen)

notes: 1 is blockades/walls (black for now), 2 is start(green), 3 is end (red)
todo: turret types to be added color wise
]]--

function map.checkPlaceableTile(x, y)
	tileFree = false
	if map[y][x] == 0 then 
		tileFree = true
	end 
	return tileFree
end

function map.draw()
local height = 32
local width = 32
local x = 0
local y = 0
    for i, v in ipairs(map) do
        for j, v in ipairs(map[i]) do
				if v == 0 then 
					love.graphics.setColor(0,150,0)
                elseif v == 1 then
                    love.graphics.setColor(0,0,0)
                elseif v == 2 then
                    love.graphics.setColor(0, 255, 0)
                elseif v == 3 then
                    love.graphics.setColor(255, 0, 0)
				elseif v == 9 then 
					love.graphics.setColor(180,100,50)
                else 
                    love.graphics.setColor(255, 255, 255)
                end
                love.graphics.rectangle("fill", x, y, height, width)
                x = j * 32
        end
        y = i * 32
    end

end

