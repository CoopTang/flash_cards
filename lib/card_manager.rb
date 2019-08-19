class CardManager
  attr_reader :cards

  def initialize
    @cards = []
  end

  # TODO: Better data validation
  # What exactly do I want a card to be?
  def validate_data(question, answer, category)
    if question.class != String || answer.class != String || category.class != String
      false
    else
      true
    end
  end

  def create_card(question, answer, category)
    if validate_data(question, answer, category)
      @cards.push(Card.new(question, answer, category)).last
    end
  end

  def cards_in_category(category)
    @cards.find_all { |card| card.category == category }
  end

  # def load_from_file(file_name) 
  #   if @cards_by_file.has_key?(file_name)
  #     puts "File already loaded!"
  #   else
  #     if File.exist?(file_name)
  #       @cards_by_file[file_name] = []
  #       file_data = File.read(file_name).split("\n")
  #       file_data.map! { |data| data.split(',') }
  #       file_data.keep_if { |data| data.length == 3}
  #       file_data.each do |data| 
  #         @cards_by_file[file_name].push(Card.new(data[0], data[1], data[2]))
  #       end
  #     else
  #       puts "File does not exist!"
  #     end
  #   end
  # end
end
