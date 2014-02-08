require 'rspec'
require 'deck'

describe Deck do

  subject(:deck) { Deck.new }

  it "should initialize with 52 unique cards" do
    expect(deck.shoe.uniq.length).to eq(52)
  end

  it "should shuffle itself" do
    expect(deck.shoe[0]).to_not eq(deck.shuffle[0])
  end

  let(:hand) { deck.deal(5) }

  it "should deal hands" do
    expect(hand.length).to eq(5)
    expect(hand.all? { |card| card.is_a?(Card) } ).to eq(true)
    expect(deck.shoe.length).to eq(52 - hand.length)
  end

end