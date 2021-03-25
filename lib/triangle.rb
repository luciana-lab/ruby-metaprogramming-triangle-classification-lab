#couldn't resolve this one. Use this https://github.com/learn-co-students/triangle-classification-v-000/pull/43/files
require 'pry'
class Triangle
  attr_accessor :hypotenuse, :adjacent, :opposite, :all_triangles

  def initialize(hypotenuse, adjacent, opposite)
    @hypotenuse = hypotenuse
    @adjacent = adjacent
    @opposite = opposite
    @all_triangles = [hypotenuse, adjacent, opposite].sort
  end

  def kind
    #binding.pry
    if triangle_illegal
      raise TriangleError
    elsif all_triangles.uniq.length == 1
      :equilateral
    elsif all_triangles.uniq.length == 2
      :isosceles
    else 
      :scalene
    end
  end

  def triangle_illegal
    #binding.pry
    all_triangles.any? {|side| side <= 0} || all_triangles[0] + all_triangles[1] <= all_triangles[2]
  end

  class TriangleError < StandardError

  end

end
