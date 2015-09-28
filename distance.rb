#Find the K closest points to the origin in 2D plane, given an array containing N points. You can assume K is much smaller than N and N is very large. The returned array should be ordered by closeness to the origin
require "minitest/autorun"
require "pry"

class KNearestPointsTest < Minitest::Test
  def test_k_nearest_points
    points = [[1, 1], [2, 1], [10, 10]]
    points2 = [[100, 100], [2, 1], [1000, 1337], [10, 10]]

    assert_equal [[1, 1], [2, 1]], k_nearest_points(2, points)
    assert_equal [[2, 1], [10, 10], [100, 100]], k_nearest_points(3, points2)
  end

  def k_nearest_points(num, points)
    hash = {}
    points.each do |node|
      hash[node] = distance(node)
    end
    new_points = []
    hash.sort_by { |_, v| v }.first(num).each do |sorted_point|
      new_points << sorted_point.first
    end
    new_points
  end

  def distance(point)
    Math.sqrt(point[0] + point[1])
  end
end
