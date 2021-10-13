require_relative "../citizen"

describe Citizen do
  describe '#initialize' do
    it 'should return an instance of Citizen' do
      david = Citizen.new('David', 'Mambou', 17)
      expect(david).to be_a(Citizen)
    end
  end

  describe '#can_vote?' do
    it 'should return false if a citizen can\'t vote' do
      david = Citizen.new('David', 'Mambou', 17)
      expect(david.can_vote?).to eq(false)
    end

    it 'should return true if a citizen can vote' do
      david = Citizen.new('David', 'Mambou', 18)
      expect(david.can_vote?).to eq(true)
    end
  end
end