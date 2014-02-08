require 'deck'

class Hand

  SCORE = {
    1 => "High Card",
    2 => "One Pair",
    3 => "Two Pair",
    4 => "Three of a Kind",
    5 => "Straight",
    6 => "Flush",
    7 => "Full House",
    8 => "Four of a Kind",
    9 => "Straight Flush"
  }

  attr_reader :cards, :repeats

  def initialize(cards)
    @cards = cards
    @score = 1
  end

  def score_hand
    straight_or_flush? || repeated_cards?
    return SCORE[@score]
  end

  def is_straight?(arr)
    (0..arr.length-2).each do |idx|
      return false if arr[idx] != arr[idx+1] - 1
    end
    true
  end

  def straight_or_flush?
    flush_suit = @cards.first.suit
    flush = @cards.all? { |card| card.suit ==  flush_suit }
    straight = is_straight?( @cards.map{ |card| card.num_value}.sort )

    if flush && straight
      @score = 9
    elsif flush
      @score = 6
    elsif straight
      @score = 5
    else
      return false
    end

    true
  end

  def repeated_cards?
    card_counts = Hash.new(0)
    @cards.each do |card|
      card_counts[card.value] += 1
    end

    @repeats = card_counts.sort_by{ |card_value, count| count }

    if @repeats.last[1] == 4
      @score = 8
    elsif @repeats[-1][1] == 3 && @repeats[-2][1] == 2
      @score = 7
    elsif @repeats.last[1] == 3
      @score = 4
    elsif @repeats[-1][1] == 2 && @repeats[-2][1] == 2
      @score = 3
    elsif @repeats[-1][1] == 2
      @score = 2
    else
      return false
    end

    true
  end

  def tie_breaker(hand)
    sorted = [1,5,6,9]
    repeat_hands = [4,7,8]

    if sorted.include?(@score)
      #sorted first
      opp = hand.cards.sort_by{|card| card.num_value}.reverse
      current = @cards.sort_by{|card| card.num_value}.reverse

      current.each_with_index do |el, index|
        if el.num_value < opp[index].num_value
          return true
        end
      end
      false
    elsif repeat_hands.include?(@score)
      opp_repeat = find_repeats(hand)
      current_repeat = find_repeats(@hand)
      return true if opp_repeat.num_value > current_repeat.num_value
      false
    else
      while true
        opp = find_repeats(hand).num_value
        curr = find_repeats(@hand).num_value
        return true if opp > curr
        return false if curr > opp
        if opp == curr
          hand.delete_if{|el| el.num_value == opp}
          @hand.delete_if{|el| el.num_value == curr}
        end
      end
    end


  end

  protected

  def find_repeats(hand)
    hand.sort_by!{|card| card.num_value}.reverse
    hand.cards.each do |el|
      if hand.cards.count{|el| el.num_value} > 2
        return el
      end
    end
    hand.first
  end


end