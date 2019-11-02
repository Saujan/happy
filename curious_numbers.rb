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
  	@end_number = digit.abs.to_f
  end

  def execute
  	(0..@end_number).filter do |num|
  		num if potential_number?(num) && curious_number?(num)
  	end
  end

  def potential_number?(a_num)
  	[0,1,5,6].include?a_num.digits.first
  end

  def curious_number?(a_num)
  	(a_num * a_num).to_s[-a_num.digits.count..-1].to_f == a_num
  end
end

if __FILE__ == $0
	print CuriousNumbers.new(1000).execute
end