require("draw")
require("input")
require("action")
require("rules")

function love.load()
    game_state = 1 -- 1: start; 2: play; 3: gameover

    field_size = 50
    field_lines = 9
    piece_rad = 25

    piece_matrix = {}

    start_game()

    love.window.setMode(field_size*10, field_size*10, resizable)

    love.graphics.setNewFont("ka1.ttf", 16)
end

function love.draw()
    draw_field()

    for c = 1, field_lines do
        for r = 1, field_lines do
            draw_piece(piece_matrix[c][r], c, r)
        end
    end

    count_scores()
    draw_scores()

    if game_state == 1 or game_state == 3 then
        draw_menu()
    end
end

function love.conf(t)
    t.console = true
end
