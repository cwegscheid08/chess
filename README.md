# CHESS

## INITIAL THOUGHTS

For this application, I will build a playable chess game. It will play as either 1_player vs computer or 1_player vs 2_player. For this, I will adopt a few parts from previous programs.  Knight_work will provide the classes: Board, GamePieces, and Knight.  Connect_four will provide classes: Game, Human, and Computer. Each of these classes will have to be retrofitted to not only each other, but to the game of chess. Lastly, I will need to adopt some sort of save state. This will have to be taken from the hangman application. This program will save serilazed information collected from each class, using YML as the serializer.

The knight_work library is already set to build a board and game_pieces that interact with it.  It has a sample game_piece child class, Knight, which has it's own traits that interact with GamePieces and Board. To continue to build this out, I will need to make more individiual game_piece classes based on the remaining game_pieces.  They will be as follows: Pawn, Rook, Bishop, King, and Queen (omitting Knight since it has previously been built). Each will have a few pieces of unique data that will have to be built for them, mainly being their move set.  

The connect_four library will bring over the classes: Game, Human, and Computer. If Game is initialized with one argument, it will start a new game with that argument as player_1 name.  Game.start should continute to call the round method until the came it is over. Small changes will need to be made to Computer and Human guesses method to represent cell movement. Randomization will take a bit of thought inside of Computer. 

## SAVE STATE

YML serialization will be used to save each version of the game. It will have to house the Board object, which will contain GamePieces and their locations.  


### CLASS WORK

#### BOARD

Board already builds an appropriately size board, where a cell marked [0,0]-[7,7] is either nil? or equal to a GamePiece object.

#### GAME

Game will have to contain the rules for total game play as well as finishing. Both the round and game_over? method will need some work to fit in the rules of chess.  Save state rules will also be held here so that the most aspects of the application will be in view. Within the Game class, player_1 and player_2 will have to be each assigned either white or black as a color, to differentiate game_piece sets.

#### HUMAN

Will house the name of the human player as well as collect and format a cell/game_piece move return for the round method.

#### COMPUTER

Will house the name of the computer player as well as randomize and format a cell/game_piece move return for the round method

#### GAME_PIECES

Houses parent information for each following GamePiece, as well as instructions for creation of a tree of available moves based on the move_set in the individual GamePiece class.


### TESTING

#### BOARD
#####DISPLAY
#####CHECK?
#####CHECK_MATE? 

#### GAME
#####PLAYER_1
#####PLAYER_2
#####GAME_OVER?
#####ROUND

#### HUMAN
#####MOVE
#####NAME
#####PLAYER_SET

#### COMPUTER
#####MOVE
#####NAME
#####PLAYER_SET

#### GAME_PIECES

