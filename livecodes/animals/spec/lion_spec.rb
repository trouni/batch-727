require_relative '../lion'

describe Lion do
  describe '#initialize' do
    it 'should return an instance of Lion' do
      expect(Lion.new('Simba')).to be_a(Lion)
    end
  end

  describe '#talk' do
    it 'should return "Simba roars" for a Lion named Simba' do
      lion = Lion.new('Simba')
      expect(lion.talk).to eq('Simba roars')
    end
  end

  describe '#eat' do
    it 'should return what the lion eats followed by "Law of the Jungle!"' do
      lion = Lion.new('Simba')
      expect(lion.eat('a gazelle')).to eq('Simba eats a gazelle. Law of the Jungle!')
    end
  end
end
