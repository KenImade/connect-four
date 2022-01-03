class Gameboard

    attr_accessor :board

    def initialize(number = 7)
        @number = number
        @board = create_board(number)
    end

    def create_board(number)
        # creates a board with the inputted number
        # returns a board with the number inputted as the number of columns
        # and the number of rows one less than the inputted number
        # if 7 is used it will return a 7 x 6 board

        board = []
        col = number
        row = number-1 
        row.times {|i| board << i = Array.new(col, "O")}
        board
    end

    def player_input(col)
        # gets player input and checks if the number is within the range of columns
        # returns the integer version of the inputted number

        col = col.to_i

        while column_full?(col)
            puts "The column is full please choose another column"
            col = gets.chomp.to_i
        end

        while !(1..@number).include?(col)
            puts "Invalid column please choose a valid column"
            col = gets.chomp.to_i
        end

        col
    end

    def update_board(col, symbol)
        # takes the column number and inputs the symbol if the column is not full
        col = col - 1
        row = @number - 2

        filled = false

        while !filled
            if @board[row][col] == "O"
                @board[row][col] = symbol
                break
            end
            row -= 1
        end
    end

    # private
    def column_full?(col)
        # returns true if the selected column is filled
        # else false
        return false if @board[0][col - 1] == "O"
        true
    end

    def check_draw?()
        false  
    end

    def check_winner?(symbol)
        return true if four_horizontal?(symbol) || four_diagonal?(symbol) || four_vertical?(symbol)
        false
    end

    def four_horizontal?(symbol)
        @board.each_with_index do |row, index|
            row.each_index do |col|
                return true if @board[index][col] == symbol && @board[index][col + 1] == symbol && @board[index][col + 2] == symbol && @board[index][col + 3] == symbol
            end
        end
        false
    end

    def four_diagonal?(symbol)
        false
    end

    def four_vertical?(symbol)
        limit = 4
        @board.transpose.each do |col|
            (0..@board.length - limit).each do |start|
                return true if col[start, limit].all?(symbol)
            end
        end
        false
    end

    def display_board()
        # displays the board on the screen
        puts " "
        @board.each do |row|
            puts row.join " "
        end
        arr = []
        @number.times {|i| arr << i + 1}
        puts arr.join" " 
        puts " "
    end
end

board = Gameboard.new
board.display_board

