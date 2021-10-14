require_relative '../animal'

describe Animal do
  describe '#initialize' do
    it 'should return an instance of Animal' do
      expect(Animal.new('Simba')).to be_an(Animal)
    end
  end

  describe '#name' do
    it 'should expose the name of the animal' do
      simba = Animal.new('Simba')
      expect(simba.name).to eq('Simba')
    end
  end

  describe '::phyla' do
    it 'should return all the phylas in an array' do
      expect(Animal.phyla).to eq(['worms', 'molluscs', 'weirder worms', 'the ones with the back-end'])
    end
  end

  describe '#eat' do
    it 'should return what the animal eats' do
      animal = Animal.new('Timon')
      expect(animal.eat('a scorpion')).to eq('Timon eats a scorpion')
    end
  end
end
