class Player
  attr_accessor :cards

  def initialize(name)
    @name = name
    @cards = []
  end

  def show_hand
    puts "#{@name} #{@name == "You" ? "have" : "has"}"
    @cards.each { |card| puts card.show }
  end

  def show_random_card
    puts @cards.sample.show
  end

  def hand_value
    @cards.map(&:value).inject(0, &:+)
  end
end
