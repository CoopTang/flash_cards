require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'

class RoundTest < Minitest::Test

  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
  end

  def test_it_exists
    assert_instance_of Round, @round
  end

  def test_it_has_deck
    assert_equal @deck, @round.deck  
  end

  def test_current_card
    assert_equal @card_1, @round.current_card
  end

  def test_turn_created
    assert_instance_of Turn, @round.take_turn("Jueau")
  end

  def test_card_removed
    @round.take_turn("Juneau")

    assert_equal @card_2, @round.current_card
  end

  def test_number_correct
    @round.take_turn("Juneau")
    @round.take_turn("I don't know")
    @round.take_turn("North north west")
    
    assert_equal 2, @round.number_correct
  end

  def test_number_correct_by_category
    @round.take_turn("Juneau")
    @round.take_turn("I don't know")
    @round.take_turn("North north west")

    assert_equal 1, @round.number_correct_by_category(:STEM)
  end

  def test_percent_correct
    @round.take_turn("Juneau")
    @round.take_turn("I don't know")
    @round.take_turn("North north west")

    assert_equal 66.6667, @round.percent_correct
  end

  def test_percent_correct_by_category
    @round.take_turn("Juneau")
    @round.take_turn("I don't know")
    @round.take_turn("North north west")

    assert_equal 50.0, @round.percent_correct_by_category(:STEM)
  end

end
