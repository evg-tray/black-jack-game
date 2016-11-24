require_relative '../core_ext/string/colorize'
require_relative 'card'

class CardsDeck
  SUITS = [
    "\u2665".encode('utf-8').red,
    "\u2666".encode('utf-8').red,
    "\u2663".encode('utf-8'),
    "\u2660".encode('utf-8')
  ]
  FACES = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'A', 'K', 'Q', 'J']

  def initialize
    @deck = []
    SUITS.each do |suit|
      FACES.each do |face|
        @deck << Card.new(face, suit)
      end
    end
    @deck.shuffle!
  end

  def take_a_card
    @deck.shift
  end
end
