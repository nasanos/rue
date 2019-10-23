function place_piece(player, opponent, column, row)
    if piece_matrix[column][row] == 0 and check_surroundings(player, opponent, column, row) == false then
        piece_matrix[column][row] = player

        check_kills(player, opponent)
        if not check_gameover(opponent, player) then
            if player == 1 then
                ai_move()
            end
        end
    end
end

function ai_move()
    local go = 0
    while go == 0 do
        local column = math.random(1, field_lines)
        local row = math.random(1, field_lines)

        if piece_matrix[column][row] == 0 and check_surroundings(2, 1, column, row) == false then
            place_piece(2, 1, column, row)

            --piece_matrix[column][row] = 2
            --check_kills(2, 1)

            go = 1
        end
    end
end
