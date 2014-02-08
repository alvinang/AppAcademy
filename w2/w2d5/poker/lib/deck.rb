require_relative 'card'

class Deck
  attr_reader :shoe
  def initialize
    @shoe = []
    fill_deck
  end

  def fill_deck

    pairs = Card::VALUE_STRINGS.keys.product(Card::SUIT_STRINGS.keys)
    pairs.each{ |pair| @shoe << Card.new(*pair) }

  end

  def shuffle
     @shoe.shuffle!
  end

  def deal(num_cards)
    @shoe.pop(num_cards)
  end

end