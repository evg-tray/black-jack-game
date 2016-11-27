require_relative 'core_ext/string/colorize'
require_relative 'models/cards_deck'
require_relative 'models/card'
require_relative 'models/game_set'
require_relative 'models/player'

system('clear')
puts 'Welcome to the "Black Jack Game". Enter your name:'.green
name = gets.chomp.capitalize
player = Player.new(name)
dealer = Player.new
loop do
  if player.bank.zero?
    puts 'You lose all bank!'.red
    break
  elsif dealer.zero?
    puts 'You win all bank of dealer!'.green
    break
  end
  puts "Your bank: $#{player.bank}, dealer bank: $#{dealer.bank}".cyan
  GameSet.new(player, dealer)
  puts 'Game end. Start new? (y/Y-yes, anykey-no)'.red
  command = gets.chomp
  break unless command == 'y' || command == 'Y'
end
