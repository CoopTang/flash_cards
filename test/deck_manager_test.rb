require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/card_manager'
require './lib/deck_manager'

class DeckManagerTest < Minitest::Test

  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", "Geography")
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", "STEM")
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", "STEM")
    @card_4 = Card.new("Where is Turing based out of?", "Denver", "Geography")
    @card_5 = Card.new("What is 5 + 5?", "10", "STEM")
    @card_6 = Card.new("What is a group of crows called?", "Murder", "Animals")
    @cards_1 = [@card_1, @card_2, @card_3, @card_4, @card_5]
    @cards_2 = [@card_6, @card_7]
    @card_manager = CardManager.new
    @deck_manager = DeckManager.new
  end

  def test_it_exists
    assert_instance_of DeckManager, @deck_manager
  end

  def test_it_has_decks
    assert_instance_of Hash, @deck_manager.decks
  end

  def test_load_from_file
  end

  def test_save_to_file
  end

  def test_deck_by_file
  end

end