# Behavior Pattern

class Hero
  attr_reader :damage, :abilities

  def initialize
    initialize_stats

    @damage    = damage_rating
    @abilities = occupation_abilities
  end

  def attack
    "Attacked dealing #{damage} damage"
  end

  def initialize_stats; end

  def damage_rating
    10
  end

  def occupation_abilities
    []
  end

  def greet
    greeting = ['Hello']
    greeting << unique_greeting_ling
    greeting
  end

  def unique_greeting_ling
    raise 'You must define unique_greeting_ling'
  end
end

class Warrior < Hero
  def damage_rating
    15
  end

  def occupation_abilities
    [:strike]
  end

  def unique_greeting_ling
    'Warrior is ready to fight!'
  end
end

class Mage < Hero
  def damage_rating
    7
  end

  def occupation_abilities
    [:magic_arrow]
  end
end
