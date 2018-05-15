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
