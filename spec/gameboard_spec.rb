require "./lib/gameboard.rb"

describe Gameboard do
    describe "#create_board" do
        it "checks number of rows" do
            gameboard = Gameboard.new(7)
            expect(gameboard.board.length) .to eql(6)
        end

        it "checks number of columns in the board" do
            gameboard = Gameboard.new(7)
            expect(gameboard.board[0].length) .to eql(7)
        end

        it "checks number of rows for 8 x 7 board" do
            gameboard = Gameboard.new(8)
            expect(gameboard.board.length) .to eql(7)
        end
    end

    describe "#player_input" do
        it "valid selection" do
            gameboard = Gameboard.new(7)
            expect(gameboard.player_input("7")) .to eql(7)
        end
    end

    describe "#update_board" do
        it "updates board with value" do
            gameboard = Gameboard.new(7)
            col = gameboard.player_input("7")
            gameboard.update_board(col, "x")
            expect(gameboard.board[5][6]) .to eql("x")
        end

        it "updates column with existing value" do
            gameboard = Gameboard.new(7)
            col = gameboard.player_input("7")
            3.times{gameboard.update_board(col, "x")}
            expect(gameboard.board[3][6]) .to eql("x")
        end
    end

    describe "#column_full?" do
        it "returns false" do
            gameboard = Gameboard.new(7)
            col = gameboard.player_input("6")
            expect(gameboard.column_full?(col)) .to eql(false)
        end

        it "returns true" do
            gameboard = Gameboard.new(7)
            col = gameboard.player_input("6")
            6.times{gameboard.update_board(col, "x")}
            expect(gameboard.column_full?(col)) .to eql(true)
        end
    end
end