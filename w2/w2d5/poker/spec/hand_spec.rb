require 'rspec'
require 'hand'

describe Hand do

  #let hand =
  let(:card1) { double("card1", :value => :deuce, :suit => :clubs, :num_value => 0 ) }
  let(:card2) { double("card2", :value => :three, :suit => :clubs, :num_value => 1) }
  let(:card3) { double("card3", :value => :four, :suit => :clubs, :num_value => 2) }
  let(:card4) { double("card4", :value => :five, :suit => :clubs, :num_value => 3) }
  let(:card5) { double("card5", :value => :six, :suit => :clubs, :num_value => 4) }
  let(:card6) { double("card6", :value => :six, :suit => :hearts, :num_value => 4)}
  let(:card7) { double("card7", :value => :six, :suit => :spades, :num_value => 4)}
  let(:card8) { double("card8", :value => :six, :suit => :diamonds, :num_value => 4) }
  let(:card9) { double("card9", :value => :five, :suit => :hearts, :num_value => 3)}
  let(:card10){double("card10", :value => :nine, :suit => :clubs, :num_value => 7)}
  let(:card11){ double("card11", :value => :ace, :suit => :diamonds, :num_value => 12)}
  let(:card12){ double("card12", :value => :ace, :suit => :clubs, :num_value => 12)}
  let(:card13){ double("card13", :value => :ace, :suit => :hearts, :num_value => 12)}
  let(:card14) { double("card14", :value => :five, :suit => :diamonds, :num_value => 3)}


  # allow(:card1.num_value).to receive {0}
  # :card1.num_value {0}
  it "identify straight flush" do

    cards = [card1, card2, card3, card4, card5]

    hand = Hand.new(cards)
    expect(hand.score_hand).to eq("Straight Flush")
  end

  it "identify four of a kind" do
    cards = [card1, card6, card7, card8, card5]

    hand = Hand.new(cards)
    expect(hand.score_hand).to eq("Four of a Kind")

  end

  it "identify of full house" do
    cards = [card4, card9, card7, card8, card5]

    hand = Hand.new(cards)
    expect(hand.score_hand).to eq("Full House")
  end

  it "identify flush" do
    cards = [card1, card2, card3, card4, card10]

    hand = Hand.new(cards)
    expect(hand.score_hand).to eq("Flush")
  end

  it "identify straight" do

    cards = [card1, card2, card3, card4, card6]
    hand = Hand.new(cards)
    expect(hand.score_hand).to eq("Straight")

  end

  it "identify three of a kind" do
    cards = [card5, card6, card7, card9, card10]
    hand = Hand.new(cards)
    expect(hand.score_hand).to eq("Three of a Kind")
  end

  it "identify two pair" do
    cards = [card5, card6, card4, card9, card10]
    hand = Hand.new(cards)
    expect(hand.score_hand).to eq("Two Pair")
  end

  it "identify one pair" do
    cards = [card1, card2, card4, card9, card10]
    hand = Hand.new(cards)
    expect(hand.score_hand).to eq("One Pair")
  end

  it "identify high card" do
    cards = [card1, card2, card3, card4, card9]
  end

  it "compare high cards between hands" do
    cards1 = [card1, card6, card7, card8, card11]
    cards2 = [card1, card6, card7, card8, card10]
    hand1 = Hand.new(cards1)
    hand2 = Hand.new(cards2)

    expect(hand1.tie_breaker(hand2)).to eq(false)

  end

  it "compare subsequent cards with identical high cards" do
    cards1 = [card1, card6, card7, card8, card11]
    cards2 = [card1, card6, card7, card10, card12]
    hand1 = Hand.new(cards1)
    hand2 = Hand.new(cards2)

    expect(hand1.tie_breaker(hand2)).to eq(true)

  end

  it "compare scoring hands before high cards" do
    cards1 = [card4, card9, card10, card13, card14]
    cards2 = [card6, card7, card8, card9, card10]
    hand1 = Hand.new(cards1)
    hand2 = Hand.new(cards2)

    expect(hand1.tie_breaker(hand2)).to eq(true)

  end

end
