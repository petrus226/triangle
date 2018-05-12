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

    calculate_type
  end

  private

  def validate!
    raise ArgumentsError if other_than_three_sides?
    raise InequalityError if inequal_sides?
  end

  def calculate_type
    if different_sides == 1
      :equilateral
    elsif different_sides == 2
      :isosceles
    elsif different_sides == 3
      :scalene
    end
  end

  def different_sides
    @sides.unique_count
  end

  def other_than_three_sides?
    @sides.other_than_three?
  end

  def any_null_side?
    @sides.any_null?
  end

  def inequal_sides?
    @sides.inequal?
  end

  def perimeter
    @sides.sum
  end

  class Sides
    class NullSideError < StandardError; end

    def initialize(sides)
      @sides = sides

      raise NullSideError if any_null?
    end

    def inequal?
      @sides.each do |side|
        return true if sum - side <= side
      end
      false
    end

    def unique_count
      @sides.uniq.count
    end

    def other_than_three?
      @sides.count != 3
    end

    def any_null?
      @sides.any?{|n| n <= 0}
    end

    def sum
      total = 0
      @sides.each do |side|
        total += side
      end
      total
    end
  end
end
