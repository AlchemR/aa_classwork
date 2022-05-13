require "towers"

describe "Game" do
let(:game) {Game.new}
# it "initializes with no user input" do
# expect(Game.new).to
# end
describe "#initialize" do
it "should set @sticks to a 2-D array, [[],[],[]]" do
expect(game.sticks).to eq([[4,3,2,1],[],[]])
end

it "@sticks should have 3 subarrays" do
expect(game.sticks.length).to eq(3)
end

describe "#move" do 
it "should pick a disc from the first stick and place it onto another stick" do
sticks = [[4,3,2,1],[],[]]
  expect(game.move_peice(0,2)).to eq([[4,3,2],[],[1]])
end
end



end
end