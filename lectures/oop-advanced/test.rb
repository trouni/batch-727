require_relative 'restaurant'
require_relative 'fast_food'
require_relative 'fine_dining_restaurant'

saizeria = Restaurant.new('Saizeria', 'Gotanda', 50, 'italian')

puts "#{saizeria.name} has a capacity of #{saizeria.capacity} seats."

puts "#{saizeria.name} is going through some renovations..."

saizeria.capacity = 60

puts "#{saizeria.name} has a capacity of #{saizeria.capacity} seats."

puts "#{saizeria.name} is currently #{saizeria.open? ? 'open' : 'closed'}."

puts 'Anju, Emanuel, Gareth, Karen are going to Saizeria'
saizeria.make_reservation('Anju')
saizeria.make_reservation('Emanuel')
saizeria.make_reservation('Gareth')
saizeria.make_reservation('Karen')

saizeria.display_reservations

# mcdonalds = FastFood.new("McDonald's", 'Meguro', 30, 'burgers', 2)
# saito = FineDiningRestaurant.new('Sushi Saito', 'Roppongi', 12, 'sushi', 3)

# p mcdonalds, saito
