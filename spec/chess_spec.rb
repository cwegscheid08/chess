require './lib/game.rb'

RSpec.describe Game do 
	before do
		@game = Game.new("computer")
	end

	context "This is a preset game between two seperate Computer players for a simulated game." do
		describe "#who_is_playing?" do
			it "returns the player object based on whose turn it is." do
				expect(@game.player.class).to eql(Computer)
			end
		end
	end
end