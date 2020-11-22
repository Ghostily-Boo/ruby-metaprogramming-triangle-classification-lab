require 'pry'

class Triangle

  def initialize(side_1, side_2, side_3)
    @sides = [side_1, side_2, side_3]
  end

  def valid?
    @sides.all?(&:positive?) && @sides.min(2).sum > @sides.max
  end

  def kind
    if !valid?
      raise TriangleError
    else
      if @sides.uniq.size <= 1
        :equilateral
      elsif @sides.uniq.size <= 2
        :isosceles
      else
        :scalene
      end
    end
  end

  class TriangleError < StandardError
  end


end
