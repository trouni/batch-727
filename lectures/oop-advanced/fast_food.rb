require_relative 'restaurant'

class FastFood < Restaurant
  def initialize(name, city, capacity, category, prep_time)
    super(name, city, capacity, category)
    @prep_time = prep_time
  end

  def open?
    (9..22).include? Time.now.hour
  end

  def make_reservation(_guest_name)
    puts "Sorry, we don't take reservations here."
  end
end