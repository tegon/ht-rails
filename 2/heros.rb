module Person
  def name
    self.class.name
  end

  def fly?
    false
  end

  def heat_vision?
    false
  end

  def super_power?
    false
  end

  def money?
    false
  end
end

class Hero
  include Person
end

module Flying
  def fly
    "I'm now flying"
  end

  def fly?
    true
  end
end

module SuperPower
  def super_power
    "I have super_power"
  end

  def super_power?
    true
  end
end

module HeatVision
  def heat_vision
    "I'm melting you down"
  end

  def heat_vision?
    true
  end
end

module Money
  def money
    "I'm rich!"
  end

  def money?
    true
  end
end

class SuperMan < Hero
  include Flying
  include SuperPower
  include HeatVision
end

class SpiderMan < Hero
  include SuperPower
end

class PoliceMan
  include Person
end

ultraman = PoliceMan.new
ultraman.extend(SuperPower)
ultraman.extend(HeatVision)

class Batman < Hero
  include Money
end

def inspect_hero(hero)
  puts "===== #{ hero.name }"
  puts "   fly? #{ hero.fly? }"
  puts "   super_power? #{ hero.super_power? }"
  puts "   heat_vision? #{ hero.heat_vision? }"
  puts "   money? #{ hero.money? }"
end

inspect_hero(SuperMan.new)
inspect_hero(SpiderMan.new)
inspect_hero(Batman.new)
inspect_hero(ultraman)