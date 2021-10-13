class Citizen
  attr_reader :first_name, :last_name, :age
  # def age
  #   @age
  # end

  def initialize(first_name, last_name, age)
    @first_name = first_name
    @last_name = last_name
    @age = age
  end

  def can_vote?
    age >= 18
  end

  def full_name
    return "#{first_name} #{last_name}"
  end
end
