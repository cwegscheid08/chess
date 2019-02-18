require './lib/game.rb'
require './lib/board.rb'
require './lib/human.rb'
require './lib/computer.rb'
require './lib/game_pieces.rb'
require './lib/knight.rb'


RSpec.describe GamePieces do
	before do
		@game_pieces = GamePieces.new
	end
end


RSpec.describe Computer do
	before do
		@computer = Computer.new
	end

	context "This represents a computer player." do
		describe "#name" do
			it "returns the name of the computer name." do
				expect(@computer.name).to eql("computer")
			end
		end
	end
end


RSpec.describe Game do 
	before do
		@game = Game.new("computer")
	end

	context "This is a preset game between two seperate Computer players for a simulated game." do
		describe "#who_is_playing?" do
			it "returns the player object based on whose turn it is." do
				expect(@game.player_1.class).to eql(Computer)
			end
		end
	end
end