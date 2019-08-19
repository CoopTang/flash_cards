class DeckManager
  attr_reader :decks

  def initialize(file_name=nil)
    decks = {}
  end

  def load_from_file
    true
  end

  def save_to_file
    true
  end

  def deck_by_file(file_name)
    true
  end
end

