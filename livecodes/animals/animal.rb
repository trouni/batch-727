class Animal
  attr_reader :name

  def self.phyla
    ['worms', 'molluscs', 'weirder worms', 'the ones with the back-end']
  end

  def initialize(name)
    @name = name
  end

  def eat(food)
    "#{name} eats #{food}"
  end
end
