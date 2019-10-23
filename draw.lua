function draw_field()
    if game_state == 2 then
        love.graphics.setColor(255, 255, 255, 255)
    else
        love.graphics.setColor(255, 255, 255, 128)
    end

    for i = 1, field_lines do
        love.graphics.line(field_size, field_size*i, field_size*field_lines, field_size*i)
        love.graphics.line(field_size*i, field_size, field_size*i, field_size*field_lines)
    end
end

function draw_piece(type, column, row)
    if type == 1 then
        for i = 0, piece_rad do
            love.graphics.setColor(200, math.min(10*i, 200), math.min(10*i, 200), 255)
            love.graphics.circle("line", column*field_size, row*field_size, piece_rad-i)
        end
    elseif type == 2 then
        for i = 0, piece_rad do
            love.graphics.setColor(math.min(10*i, 200), math.min(10*i, 200), 200, 255)
            love.graphics.circle("line", column*field_size, row*field_size, piece_rad-i)
        end
    end
end

function draw_scores()
    love.graphics.setColor(255, 255, 255, 255)
    love.graphics.print("Red: "..score_a, field_size, field_size/4)
    love.graphics.print("Blue: "..score_b, 3*field_size, field_size/4)
    love.graphics.print("Completion: "..completion_num % (field_lines*field_lines), 6*field_size, field_size/4)
end

function draw_menu()
    local midpoint = field_lines / 2 * field_size
    local halfunit = field_size / 2
    local quarterunit = field_size / 4

    if game_state == 1 then
        love.graphics.setColor(255, 255, 255, 255)
        love.graphics.print("Welcome to Rue!", midpoint-(field_size+quarterunit), midpoint-halfunit)
        love.graphics.print("Tap to start.", midpoint-field_size, midpoint)
    elseif game_state == 3 then
        local winner = "No one wins!"

        if score_a > score_b then winner = "Red wins!"
        elseif score_a < score_b then winner = "Blue wins!"
        else winner = "It's a tie!" end

        love.graphics.setColor(255, 255, 255, 255)
        love.graphics.print("Gameover:", midpoint-(2*quarterunit), midpoint-field_size)
        love.graphics.print(winner, midpoint-(2*quarterunit), midpoint-halfunit)
        love.graphics.print("Tap to restart.", midpoint-(5*quarterunit), midpoint+halfunit)
    end
end
