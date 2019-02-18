# CHESS

## INITIAL THOUGHTS

For this application, I will build a playable chess game. It will play as either 1_player vs computer or 1_player vs 2_player. For this, I will adopt a few parts from previous programs.  Knight_work will provide the classes: Board, GamePieces, and Knight.  Connect_four will provide classes: Game, Human, and Computer. Each of these classes will have to be retrofitted to not only each other, but to the game of chess. Lastly, I will need to adopt some sort of save state. This will have to be taken from the hangman application. This program will save serilazed information collected from each class, using YML as the serializer.

The knight_work library is already set to build a board and game_pieces that interact with it.