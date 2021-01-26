# frozen_string_literal: true

require 'pry'
# Class Player
class Player
  attr_accessor :name, :life_points

  def initialize(name)
    @name = name
    @life_points = 10
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie."
  end

  def gets_damage(damage_received)
    puts "#{@name} a pris #{damage_received} points de dégats"
    @life_points -= damage_received
    puts "#{@name} est mort, de toutes manières c'était un con***d, on s'en fout" unless @life_points.positive?
  end

  def attacks(attacked_player)
    damage_points = compute_damage
    puts "Le joueur #{@name} attaque le joueur #{attacked_player.name} et lui inflige #{damage_points}"
    attacked_player.gets_damage(damage_points)
  end

  def compute_damage
    rand(1..6)
  end
end

# Class HumanPlayer
class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(name)
    super(name)
    @weapon_level = 1
    @life_points = 100
  end

  def show_state_human
    puts "#{name} a #{life_points} points de vie et une arme de niveau #{weapon_level}."
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    founded_weapon_level = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{founded_weapon_level}."
    if founded_weapon_level > @weapon_level
      puts "L'arme trouvée est meilleure que la tienne, tu gardes l'arme de level #{founded_weapon_level}"
      @weapon_level = founded_weapon_level
    end
  end

  def search_health_pack
    health_pack = rand(1..6)
    puts "Tu n'as rien trouvé, ta vie reste à #{@life_points}" if health_pack == 1
    if health_pack > 1 && health_pack < 6
      puts "Oh gg, t'as trouvé un petit pack de vie de 50 points de vie"
      @life_points + 50 > 100 ? @life_points = 100 : @life_points += 50
    elsif health_pack == 6
      puts "OMFGGGGGG ZBFEYZEBFUY T'AS TROUVE UN ENORME PACK DE 80PTS DE VIE!!!"
      @life_points + 80 > 100 ? @life_points = 100 : @life_points += 80
    end
  end
end
