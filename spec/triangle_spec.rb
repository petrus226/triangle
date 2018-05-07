require_relative '../src/triangle'

describe 'Triangle' do

  it 'is equilateral when all its sides are equal' do
    the_length = a_length
    sides = [the_length, the_length, the_length]
    expect(Triangle.new(sides).type).to eq(:equilateral)
  end

  it 'is isosceles when two sides are equal' do
    other_length = a_length + 1
    sides = [a_length, a_length, other_length]
    expect(Triangle.new(sides).type).to eq(:isosceles)
  end

  it 'is scalene when every sides are diferent' do
    sides = [a_length, a_length + 1, a_length + 2]
    expect(Triangle.new(sides).type).to eq(:scalene)
  end

  it 'can not have null sides ' do
    sides = [a_length, 0, a_length]
    expect{
      Triangle.new(sides).type
    }.to raise_error(Triangle::NullSideError)
  end

  it 'must accomplish the tringle inequality codition' do
    too_long_side =  2 * a_length + 1
    sides = [a_length,a_length,too_long_side]
    expect{
      Triangle.new(sides).type
    }.to raise_error(Triangle::InequalityError)
  end

  it 'have to recieve three sides' do
    the_length = a_length
    sides = [the_length, the_length]
    expect{
      Triangle.new(sides).type
    }.to raise_error(Triangle::ArgumentsError)
  end

  def a_length
    2
  end
end
