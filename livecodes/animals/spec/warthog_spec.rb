require_relative '../warthog'

describe Warthog do
  describe '#initialize' do
    it 'should return an instance of Warthog' do
      expect(Warthog.new('Trouni')).to be_a(Warthog)
    end
  end

  describe '#talk' do
    it 'should return "Trouni grunts" for a Warthog named Trouni' do
      warthog = Warthog.new('Trouni')
      expect(warthog.talk).to eq('Trouni grunts')
    end
  end
end
