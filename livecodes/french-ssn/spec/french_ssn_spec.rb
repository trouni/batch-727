require_relative '../french_ssn.rb'

describe '#french_ssn_info' do
  it 'should return a string when given an empty string' do
    actual = french_ssn_info('')
    expect(actual).to eq('This number is invalid')
    # actual == expected
  end

  it 'should return "a man, born in December, 1984 in Seine-Maritime." when given "1 84 12 76 451 089 46"' do
    actual = french_ssn_info('1 84 12 76 451 089 46')
    expect(actual).to eq('a man, born in December, 1984 in Seine-Maritime.')
  end

  it 'should return "The number is invalid" when given "3 84 12 76 451 089 49"' do
    actual = french_ssn_info('3 84 12 76 451 089 49')
    expect(actual).to eq('This number is invalid')
  end

  it 'should return "The number is invalid" when given "1 84 12 76 451 089 49"' do
    actual = french_ssn_info('1 84 12 76 451 089 49')
    expect(actual).to eq('This number is invalid')
  end
end