require 'rspec'
require 'arrays'

describe "#my_uniq" do

  it "return empty array when given empty array" do
    expect([].my_uniq).to eq([])
  end

  it "return an array with no repeated values" do
    expect([1,1,2,2,3,3].my_uniq).to eq([1,2,3])
  end

  it "returns elements in the same order" do
    expect([4,5,7,4,3,3].my_uniq).to eq([4,5,7,3])
  end

end

describe "#two_sum" do

  it "return empty array when given empty array" do
    expect([].two_sum).to eq([])
  end

  it "handle multiple pairs of two sums" do
    expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
  end

  it "handle cases where two element is zero" do
    expect([-1, 0, 0, 1].two_sum).to eq([[0, 3]])
  end

end

describe TowersOfHanoi do
  subject (:game) {TowersOfHanoi.new}
  let(:towers) {game.towers}

  it "initializes a new board with 3 arrays" do
    expect(towers.length).to eq(3)
  end

  it "on start, first array contains all discs" do
    expect(towers.first).to eq([3,2,1])
  end

  it "moves dics to different arrays" do
    game.move([0,2])
    expect(towers[0].length).to eq(2)
    expect(towers[2].length).to eq(1)
  end

  it "should not allow larger disc to smaller disc" do
    # expect( 2.times{game.move([0,2]))
    expect{ 2.times{game.move([0,2])}  }.to raise_error("Invalid Move")
  end

  it "checks for win" do
    towers[2] = [3,2,1]
    expect(game.won?).to eq(true)
  end

  it "performs all moves" do
    game.move([0,2])
    game.move([0,1])
    game.move([2,1])
    game.move([0,2])
    game.move([1,0])
    game.move([1,2])
    game.move([0,2])
    expect(game.won?).to eq(true)
  end
end

describe "#my_transpose" do

  it "return empty array when given empty array" do
    expect(my_transpose([])).to eq([])
  end

  it "tranpose that freaking array" do
    expect(my_transpose([
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8]
    ])).to eq([[0, 3, 6], [1, 4, 7], [2, 5, 8]])
  end

end

describe "#stock_picker" do

  it "should return most profitable pair" do
    expect(stock_picker([1, 7, 5, 13, 7, 10])).to eq([0, 3])
  end
  s
  it "return empty array if no profitable pair" do
    expect(stock_picker([9, 6, 3, 1])).to eq([])
  end

end