require_relative "gameboard.rb"
require_relative "player.rb"
require_relative "colors.rb"


finish = true

puts "Hello welcome to Connect Four"
puts "Player 1, please input your name: "
player_one = Player.new(gets.chomp, "x".yellow)
puts "Player 2, please input your name: "
player_two = Player.new(gets.chomp, "o".pink)

puts "Alright let's play Connect Four!"
gameboard = Gameboard.new()
gameboard.display_board()

while finish
    puts "#{player_one.name} pick a slot"

    player_one_input = gameboard.player_input(gets.chomp)

    gameboard.update_board(player_one_input, player_one.indicator)

    if gameboard.check_winner?(player_one.indicator)
        puts "#{player_one.name} is the winner!"
        puts " "
        gameboard.display_board
        break
    end
    gameboard.display_board

    puts "#{player_two.name} pick a slot"

    player_two_input = gameboard.player_input(gets.chomp)
    
    gameboard.update_board(player_two_input, player_two.indicator)

    if gameboard.check_winner?(player_two.indicator)
        puts "#{player_two.name} is the winner!"
        puts " "
        gameboard.display_board
        break
    end

    gameboard.display_board

    if gameboard.check_draw?
        puts "The game is a draw!"
        puts " "
        gameboard.display_board
        break
    end
end


