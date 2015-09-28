require "minitest/autorun"

class SieveTest < Minitest::Test
  def test_sieve
    assert_equal [2, 3], Sieve.new(4).primes
    assert_equal [2, 3, 5], Sieve.new(6).primes
    assert_equal [2, 3, 5, 7, 11, 13, 17, 19, 23, 29], Sieve.new(30).primes
  end
end

class Sieve
  def initialize(n)
    @n = n
    @num_range = initial_range
  end

  def primes
    multiples
  end

  private
  attr_reader :n

  def multiples
    @ans = []
    while @num_range.any? do
      p = @num_range.shift
      @ans << p
      multiplied_range = initial_range.map { |x| x * p }
      @num_range = @num_range - multiplied_range
    end
    @ans
  end

  def initial_range
    (2..n).to_a
  end
end
