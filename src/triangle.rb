class Triangle
  class NullSideError < StandardError; end
  class ArgumentsError < StandardError; end
  class InequalityError < StandardError; end

  def initialize(sides)
    @sides = sides
  end

  def type
    raise ArgumentsError if less_three_sides?
    raise NullSideError if any_null_side?
    raise InequalityError if validate_sides?

    if different_sides == 1
      :equilateral
    elsif different_sides == 2
      :isosceles
    elsif different_sides == 3
      :scalene
    end
  end

  private

  def different_sides
    @sides.uniq.count
  end

  def less_three_sides?
    @sides.count != 3
  end

  def any_null_side?
    @sides.any?{|n| n <= 0}
  end

  def validate_sides?
    perimeter = 0
    @sides.each do |side|
      perimeter += side
    end
    @sides.each do |side|
      return true if perimeter - side <= side
    end
    false
  end
end
