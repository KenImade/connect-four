# connect-four

## HOW THE GAME WORKS
The game consist of a gameboard consisting of a 7 x 6 grid. The game is played by two players. The players take turns inputting circular colored plastics into one of the slots.
The aim of the game is for one of the players to connect four of his/her circular dots eihter horizontally, vertically or diagonally. If all the spaces are filled and none of the players are able to connect four dots. The game is concluded as a draw.


## CODING THE GAME
I created two classes the gameboard class and the player class. The gameboard class would be responsible for everything that has to do with the game itself while the player class would hold the player name and player indicator.

I tried to make the game as dynamic as possible, meaning that the gameboard class can be initialized with any number which would create a board with that number as the number of columns and the number of rows being the number minus one. The tough part came when I tried to validate whether a player had successfully placed four of his/her pieces consecutively either horizontally, vertically or diagonally. Creating the horizontal and vertical functions was straightforward but it took some time before I could come up with a dynamic way to check that there was a winner in the possible diagonal cells.