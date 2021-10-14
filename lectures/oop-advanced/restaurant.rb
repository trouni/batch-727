require_relative 'chef'

class Restaurant
  attr_reader :name, :city, :category, :chef
  # def name
  #   @name
  # end
  attr_accessor :capacity

  def self.categories
    %w[sushi burgers italian]
  end

  def initialize(name, city, capacity, category, chef_name)
    # Define the initial STATE of the restaurant
    @name = name # string
    @city = city # string
    @capacity = capacity # integer
    @category = category # string
    @chef = Chef.new(chef_name, self) # instance of Chef

    @reservations = []
  end

  def open?
    (17..22).include? Time.now.hour
  end

  def make_reservation(guest_name)
    @reservations << guest_name
  end

  def display_reservations
    puts '=' * 30
    puts "Here are the reservations for #{name}:"
    @reservations.each_with_index do |guest_name, index|
      puts "#{index + 1} - #{guest_name.capitalize}"
    end
    puts '=' * 30
  end
end