function love.draw()
	local screen_width, screen_height = love.graphics.getDimensions()

	local scale_size = 4
	love.graphics.setPointSize(scale_size)

	local current_x = screen_width / 2
	local current_y = screen_height / 2

	local current_number = 1

	for i = 1, screen_width / 2, 2 do
		current_number = current_number + 1
		current_x = current_x + scale_size
		love.print_point(current_x, current_y, current_number)
		local l = i

		love.graphics.setColor(0, 0, 1, 1)
		for j = 0, l - 1, 1 do
			current_number = current_number + 1
			current_y = current_y - scale_size
			love.print_point(current_x, current_y, current_number)
		end

		love.graphics.setColor(1, 0, 0, 1)
		for j = 0, l, 1 do
			current_number = current_number + 1
			current_x = current_x - scale_size
			love.print_point(current_x, current_y, current_number)
		end

		love.graphics.setColor(1, 1, 1, 1)
		for j = 0, l, 1 do
			current_number = current_number + 1
			current_y = current_y + scale_size
			love.print_point(current_x, current_y, current_number)
		end

		love.graphics.setColor(1, 0, 1, 1)
		for j = 0, l, 1 do
			current_number = current_number + 1
			current_x = current_x + scale_size
			love.print_point(current_x, current_y, current_number)
		end
	end
end

function love.print_point(x, y, n)
	if love.prime_check(n) then
		love.graphics.points(x, y)
	end
end

function love.prime_check(n)
    if n == 2 then
        return true
    end
    
    if n < 2 or n % 2 == 0 then
        return false
    end

    for i = 3, math.sqrt(n), 2 do
        if n % i == 0 then
            return false
        end
    end
    return true
end
