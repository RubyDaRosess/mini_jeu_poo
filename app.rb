# frozen_string_literal: true

require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

def battle
  player1 = Player.new('Joan')
  player2 = Player.new('Maelle')
  puts "Voici un combat entre #{player1.name} et #{player2.name}"
  puts player1.show_state
  puts player2.show_state
  puts 'Fight !'
  while player1.life_points.positive? || player2.life_points.positive?
    player2.attacks(player1)
    player1.show_state
    break if player1.life_points <= 0

    player1.attacks(player2)
    puts player2.show_state
  end
end

battle
