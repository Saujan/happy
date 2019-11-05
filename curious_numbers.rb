class CuriousNumbers
  attr_reader :digit, :largest_num

  BASE_CURIOUS_NUMS = [0, 1, 5, 6].freeze

  def initialize(digit)
    @digit = digit.abs
    @largest_num = ('9'*@digit).to_i
  end

  def execute
    return [0] if digit == 0
    (BASE_CURIOUS_NUMS + squared_numbers(25) + squared_numbers(36)).sort
  end

  private 

  def squared_numbers(num)
    squared_number = num
    arr = []
    until squared_number > largest_num
      arr.push(squared_number)
      squared_number = squared_number ** 2
    end
    arr
  end
end

if __FILE__ == $0
  #puts CuriousNumbers.new(2).execute
	#puts Benchmark.measure { CuriousNumbers.new(7).execute }
  puts CuriousNumbers.new(2).execute
end