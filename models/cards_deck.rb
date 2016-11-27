require_relative '../core_ext/string/colorize'
require_relative 'card'

class CardsDeck
  SUITS = [
    "\u2665".encode('utf-8').red,
    "\u2666".encode('utf-8').red,
    "\u2663".encode('utf-8'),
    "\u2660".encode('utf-8')
  ].freeze
  FACES = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'A', 'K', 'Q', 'J'].freeze

  def initialize
    @deck = Array.new(self.class.standart_deck)
    @deck.shuffle!
  end

  def take_a_card
    @deck.shift
  end

  def self.standart_deck
    if @standart_deck.nil?
      @standart_deck = []
      SUITS.each do |suit|
        FACES.each do |face|
          @standart_deck << Card.new(face, suit)
        end
      end
    end
    @standart_deck
  end
end
