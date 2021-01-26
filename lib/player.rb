# frozen_string_literal: true

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


class HumanPlayer < Player
attr_accessor  :weapon_level

  def initialize(name)
    @life_points = 100
    @weapon_level = 1
  end

  def show_state
    puts "#{name} a #{life_points} points de vie et une arme de niveau #{weapon_level}".
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    weapon_level = rand(1..6)


    puts  "Tu as trouvé une arme de niveau #{weapon_level}".

  end

   
  def search_health_pack
    health_pack = rand(1..6)
  end



