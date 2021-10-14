require_relative 'restaurant'

class FineDiningRestaurant < Restaurant
  def initialize(name, city, capacity, category, stars)
    super(name, city, capacity, category)
    @stars = stars
  end

  def open?
    super || (11..14).include?(Time.now.hour)
  end
end