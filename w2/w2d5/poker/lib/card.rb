# coding: utf-8

class Card

  attr_reader :suit, :value

  SUIT_STRINGS = {
    :clubs    => "♣",
    :diamonds => "♦",
    :hearts   => "♥",
    :spades   => "♠"
  }

  VALUE_STRINGS = {
    :deuce => "2",
    :three => "3",
    :four  => "4",
    :five  => "5",
    :six   => "6",
    :seven => "7",
    :eight => "8",
    :nine  => "9",
    :ten   => "10",
    :jack  => "J",
    :queen => "Q",
    :king  => "K",
    :ace   => "A"
  }

  # def initialize(options = {})
  #   defaults = {
  #     :value => VALUE_STRINGS.keys.sample,
  #     :suit => SUIT_STRINGS.keys.sample
  #   }
  #   vals = defaults.merge(options)
  #   @suit = vals[:suit]
  #   @value = vals[:value]
  # end
  def initialize(value = VALUE_STRINGS.keys.sample, suit = SUIT_STRINGS.keys.sample)
    @suit = suit
    @value = value
  end

  def to_s
    VALUE_STRINGS[@value] + SUIT_STRINGS[@suit]
  end

  def num_value(value = @value)
    VALUE_STRINGS.keys.index(value)
  end

end
