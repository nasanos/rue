function start_game()
    for i = 1, field_lines do
        piece_matrix[i] = {}
        for ii = 1, field_lines do
            piece_matrix[i][ii] = 0
        end
    end

    score_a = 0
    score_b = 0
    completion_num = 0
end

function check_gameover(player, opponent)
    local continue = 0

    for c = 1, field_lines do
        for r = 1, field_lines do
            if piece_matrix[c][r] == 0 and check_surroundings(player, opponent, c, r) == false then
                continue = 1
            end
        end
    end

    if continue == 0 then
        game_state = 3
        return true
    else
        return false
    end
end

function check_kills()
    for c = 1, field_lines do
        for r = 1, field_lines do
            if piece_matrix[c][r] == 1 then
                if check_surroundings(1, 2, c, r) then
                    piece_matrix[c][r] = 0
                end
            elseif piece_matrix[c][r] == 2 then
                if check_surroundings(2, 1, c, r) then
                    piece_matrix[c][r] = 0
                end
            end
        end
    end
end

function check_surroundings(player, opponent, column, row)
    local friendly_counter = 0
    local unfriendly_counter = 0
    local neutral_counter = 0

    for c = -1, 1 do
        if piece_matrix[column+c] ~= nil then
            if piece_matrix[column+c][row] == player and c ~= 0 then
                friendly_counter = friendly_counter + 1
            elseif piece_matrix[column+c][row] == opponent and c ~= 0 then
                unfriendly_counter = unfriendly_counter + 1
            end
        else
            neutral_counter = neutral_counter + 1
        end
    end

    for r = -1, 1 do
        if piece_matrix[column][row+r] ~= nil then
            if piece_matrix[column][row+r] == player and r ~= 0 then
                friendly_counter = friendly_counter + 1
            elseif piece_matrix[column][row+r] == opponent and r ~= 0 then
                unfriendly_counter = unfriendly_counter + 1
            end
        else
            neutral_counter = neutral_counter + 1
        end
    end

    if (unfriendly_counter + neutral_counter) >= 4 then
        return true
    else
        return false
    end
end

function count_scores()
    score_a = 0
    score_b = 0
    completion_num = 0

    for c = 1, field_lines do
        for r = 1, field_lines do
            if piece_matrix[c][r] == 1 then
                score_a = score_a + 1
            elseif piece_matrix[c][r] == 2 then
                score_b = score_b + 1
            end
        end
    end

    completion_num = score_a + score_b
end
