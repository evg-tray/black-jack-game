require_relative 'core_ext/string/colorize'
require_relative 'models/cards_deck'
require_relative 'models/card'
require_relative 'models/game_set'
require_relative 'models/player'

system('clear')
puts 'Welcome to the "Black Jack Game". Enter your name:'.green
name = gets.chomp.capitalize
loop do
  player = Player.new(name)
  dealer = Player.new
  deck = CardsDeck.new
  puts 'Game end. Start new? (y/Y-yes, anykey-no)'.red
  command = gets.chomp
  break unless command == "y" || command == "Y"
end
