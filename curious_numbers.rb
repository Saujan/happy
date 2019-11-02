# Curious Number
# n-digit number is said to be curious if the last n digits of 
# its square are the same as the original number.
# For example, 25^2 = 625 and 76^2 = 5776.
# (Curious numbers are also known as automorphic numbers.)

# An example of 9 digit number:
# 212890625^2 = 45322418212890625

#Q. Complete the code to return all the curious numbers for n digit

#Write a code in following format

class CuriousNumbers
  def initialize(digit)
  	@digit = digit.abs
  end

  def execute
  	(lowest_number..highest_number).filter do |num|
  		num if potential_number?(num) && curious_number?(num)
  	end
  end

 	private 

  def potential_number?(a_num)
  	[0,1,5,6].include?a_num.digits[0]
  end

  def curious_number?(a_num)
  	(a_num**2).to_s[-(a_num.digits.count)..-1].to_i == a_num
  end

  def lowest_number
  	lowest = '1'
  	@digit < 2 && 0 || (@digit - 1).times { lowest+='0'} && lowest.to_i
  end

  def highest_number
  	highest = ''
  	@digit == 0 && 	0 || @digit == 1 && 9 || @digit.times { highest += '9'} && highest.to_i
  end
end

if __FILE__ == $0
	puts CuriousNumbers.new(1).execute
end