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

    def check_winner?(symbol)
        # returns true if there is are four consecutive symbols placed horizontally, vertically
        # or diagonally on the board else false

        return true if four_horizontal?(symbol) || four_diagonal?(symbol) || four_vertical?(symbol)
        false
    end

    def check_draw?()
        # returns false if any position in the board still contains the placeholder value
        # else true

        return false if @board.flatten.any?("O")
        true  
    end

    private
    def column_full?(col)
        # returns true if the selected column is filled
        # else false

        return false if @board[0][col - 1] == "O"
        true
    end

    def four_horizontal?(symbol)
        # returns true if four horizontal cells have the same symbols
        # else false

        limit = 4
        @board.each do |row|
            (0..@board.length - limit).each do |start|
                return true if row[start, limit].all?(symbol)
            end
        end
        false
    end

    def four_diagonal?(symbol)
        # returns true if there are four consecutive pieces of the same symbol placed either in
        # ascending diagonal order or descending diagonal order else returns false

        return true if ascending_diagonal_check?(symbol) || descending_diagonal_check?(symbol)
        false
    end

    def ascending_diagonal_check?(symbol)
        # returns true if there are four of the same symbol in the ascending diagonals
        # else false

        i = 3
        (i...@board.length).each do |row|
            (0...@board[0].length - 3).each do |col|
                if @board[row][col] == symbol && @board[row - 1][col + 1] == symbol && @board[row - 2][col + 2] == symbol && @board[row - 3][col + 3] == symbol
                    return true
                end
            end
        end
        false
    end

    def descending_diagonal_check?(symbol)
        # returns true if there are four of the same symbol in the descending diagonals
        # else false

        i = 3
        (i...@board.length).each do |row|
            (3...@board[0].length).each do |col|
                if @board[row][col] == symbol && @board[row - 1][col - 1] == symbol && @board[row - 2][col - 2] == symbol && @board[row - 3][col - 3] == symbol
                    return true
                end
            end
        end
        
        false
    end

    def four_vertical?(symbol)
        # returns true if there are four consecutive pieces arranged vertically on the board
        # returns false

        limit = 4
        @board.transpose.each do |col|
            (0..@board.length - limit).each do |start|
                return true if col[start, limit].all?(symbol)
            end
        end
        false
    end
end

board = Gameboard.new
board.display_board