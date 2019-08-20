require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/card_manager'

class CardManagerTest < Minitest::Test
  
  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", "Geography")
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", "STEM")
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", "STEM")
    @card_4 = Card.new("Where is Turing based out of?", "Denver", "Geography")
    @card_5 = Card.new("What is 5 + 5?", "10", "STEM")
    @cards = [@card_1, @card_2, @card_3, @card_4, @card_5]
    @card_manager = CardManager.new
  end

  def test_it_exists
    assert_instance_of CardManager, @card_manager
  end

  def test_validate_data
    assert @card_manager.validate_data("This", "Is", "Correct")
    refute @card_manager.validate_data("This", "Is", :false)
    refute @card_manager.validate_data("This", 25, "false")
    refute @card_manager.validate_data(true, "Not", "Really")
  end

  def test_create_card
    assert_instance_of Card, @card_manager.create_card("Produces", "New", "Card")
    assert_nil @card_manager.create_card("Not", "Card", false)
  end

  def test_cards_in_category
    @card_manager.create_card("What is the capital of Alaska?", "Juneau", "Geography")
    @card_manager.create_card("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", "STEM")
    @card_manager.create_card("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", "STEM")
    @card_manager.create_card("Where is Turing based out of?", "Denver", "Geography")
    @card_manager.create_card("What is 5 + 5?", "10", "STEM")

    assert_equal [@card_1, @card_4], @card_manager.cards_in_category("Geography")
    assert_equal [@card_2, @card_3, @card_5], @card_manager.cards_in_category("STEM")
    assert_equal [], @card_manager.cards_in_category("Not a category")
  end
end
