require_relative '../src/sides'

class Triangle
  class NullSideError < StandardError; end
  class ArgumentsError < StandardError; end
  class InequalityError < StandardError; end

  def initialize(sides)
    @sides = Sides.new(sides)

    rescue
      raise NullSideError
  end

  def type
    validate!
    TYPES[different_sides]
  end

  private

  def validate!
    raise ArgumentsError if other_than_three_sides?
    raise InequalityError if inequal_sides?
  end

  TYPES = {
    1 => :equilateral,
    2 => :isosceles,
    3 => :scalene
  }

  def different_sides
    @sides.unique_count
  end

  def other_than_three_sides?
    @sides.how_many != 3
  end

  def any_null_side?
    @sides.any_null?
  end

  def inequal_sides?
    result = false
    @sides.combinations_two do |a,b|
      result = true if a + b <= c_side(a,b)
    end
    result
  end

  def c_side(a,b)
    perimeter - (a + b)
  end

  def perimeter
    @sides.sum
  end
end
