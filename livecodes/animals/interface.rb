require_relative 'lion'
require_relative 'meerkat'
require_relative 'warthog'

# create an array with Simba, Nala, Timon & Pumbaa
simba = Lion.new('Simba')
nala = Lion.new('Nala')
timon = Meerkat.new('Timon')
pumbaa = Warthog.new('Pumbaa')
animals = [simba, nala, timon, pumbaa]

# iterate over it
animals.each do |animal|
  # puts the sound each animal makes
  puts animal.talk # talk can be called on different classes => Polymorphism / Duck-typing
end
