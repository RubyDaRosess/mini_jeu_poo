require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

def menu
  puts "\nTu vas faire quoi?!\n\n"
  puts 'a - Cherche une arme!'
  puts 'h - Cherche un pack de heal!'
  puts "\n Attaque un ennemi !!!\n\n"
  puts "0 - Attaque Joan! (Joan a #{@life_points} points de vie)"
  puts "1 - Attaque Maëlle! (Joan a #{@life_points} points de vie)"
  puts 'quit - Quitte le jeu.'
end
# Message de Bienvenue
puts '------------------------------------------------'
puts "Bienvenue sur 'ILS VEULENT TOUS MON README.md!'"
puts "Le but du jeu est d'être le dernier à mourir!"
puts '------------------------------------------------'
# Initialisation du joueur

print 'Qui utilise cette manette ? ~>'

human_player = HumanPlayer.new(gets.chomp.to_s)

# Initialisation des ennemis

enemies = [enemy1 = Player.new('Joan'), enemy2 = Player.new('Maëlle')]

# Le combat

puts '------------Que le combat commence!---------------'
while human_player.life_points.positive? && (enemy1.life_points.positive? || enemy2.life_points.positive?)
  puts '-----------------------Menu-----------------------'
  menu
  puts "------------------C'est ton tour------------------"
  print 'Quel est ton choix? ~>'
  case gets.chomp.to_s
  when 'a' then human_player.search_weapon
  when 'h' then human_player.search_health_pack
  when '0' then human_player.attacks(enemy1)
  when '1' then human_player.attacks(enemy2)
  when 'quit' then break
  end

  puts "--------------C'est le tour des ennemis-------------"
  enemies.each { |index| index.attacks(human_player) if index.life_points.positive? }
  puts '-------------------Etat des joueurs-----------------'
  human_player.show_state
  enemy1.show_state
  enemy2.show_state
end

puts '-------------Fin de la partie------------------'
puts human_player.life_points.positive? ? "Bien joué! T'as gagné! T'as gagné quoi? Bah rien :troll:" : "T'as perdu, t'es nul!"
