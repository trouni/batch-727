# file name is lower_snake_cased
# class name is UpperCamelCased
class Car
  attr_accessor :color # creates both attr_reader and attr_writer

  attr_reader :brand
  # attr_reader names need to match the @instance variable
  # => we define a custom reader for engine_started? with a ?

  # attr_writer :color # will create a color= method (already defined in the accessor)

  # also named constructor
  def initialize(color, brand = 'Ford')
    # ===== STATE =====
    # @instance variables (encapsulated)
    @color = color # string
    @brand = brand # string
    @engine_started = false # boolean
  end

  # ===== BEHAVIOUR =====

  # instance methods
  def start
    inject_fuel
    spark_plugs
    crank_engine

    @engine_started = true
  end

  # attribute reader
  # attr_reader :color # <= is a shortcut for:
  # def color
  #   @color
  # end

  # attr_reader :engine_started
  def engine_started?
    @engine_started
  end

  # attribute writer
  # attr_writer :color # <= is a shortcut for:
  # def color=(new_color)
  #   @color = new_color
  # end

  # def paint(new_color)
  #   @color = new_color
  # end

  private

  def inject_fuel
    puts 'Injecting fuel...'
  end

  def spark_plugs
    puts 'Sparking plugs...'
  end

  def crank_engine
    puts 'Cranking engine...'
  end
end

# not an instance method
# def color
#   puts "normal color method"
# end

puts 'Creating a car for Carlos'
carlos_car = Car.new('black')

puts "Carlos' car is #{carlos_car.color}"

puts '==='

puts "Carlos' car is currently #{carlos_car.engine_started? ? 'started' : 'not started'}."

puts "Let's start the car..."
carlos_car.start

puts "Carlos' car is currently #{carlos_car.engine_started? ? 'started' : 'not started'}."

puts '==='

puts 'Carlos paints his car orange'
carlos_car.color = 'orange'

puts "Carlos' car is now #{carlos_car.color}"
