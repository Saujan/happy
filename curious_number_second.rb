# Curious Number
# n-digit number is said to be curious if the last n digits of 
# its square are the same as the original number.
# For example, 25^2 = 625 and 76^2 = 5776.
# (Curious numbers are also known as automorphic numbers.)

# An example of 9 digit number:
# 212890625^2 = 45322418212890625

#Q. Complete the code to return all the curious numbers for n digit

#Write a code in following format
require 'benchmark'
class CuriousNumbers
  attr_reader :curious_five, :curious_six
  def initialize(digit)
  	@digit = digit.abs
    @curious_five = [5]
    @curious_six = []
  end

  def execute
    return if @digit < 1
    ([0,1] + other_curious_numbers).sort.uniq
  end

 	private

  def other_curious_numbers
    ends_with_five
    ends_with_six
    @curious_five + @curious_six
  end

  def ends_with_five
    (2..@digit).each do |num|
      curious_five << (@curious_five.last**2).to_s[-num..-1].to_i
    end
  end

  def ends_with_six
    (1..@digit).each do |num|
      curious_six << (10**num+1) - curious_five[num-1]
    end
  end
end

if __FILE__ == $0
  puts CuriousNumbers.new(9).execute
end