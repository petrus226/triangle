class Sides
  class NullSideError < StandardError; end

  def initialize(sides)
    @sides = sides

    raise NullSideError if any_null?
  end

  def unique_count
    @sides.uniq.count
  end

  def how_many
    @sides.count
  end

  def any_null?
    @sides.any?{|n| n <= 0}
  end

  def combinations_two
    yield @sides[0], @sides[1]
    yield @sides[1], @sides[2]
    yield @sides[2], @sides[0]
  end

  def sum
    total = 0
    @sides.each do |side|
      total += side
    end
    total
  end
end
