#require 'byebug'
class HappyNumberEngine
	attr_accessor :visited_numbers
	
	def initialize
		@visited_numbers = [] # the container that collects the visited number.
	end

	def happy_number_minner(num)
		# if need_squared?(num) # checking if squaring needed . Allow squaring except for 1.
		# 	squared_num = single_digit_squared(num.to_s) #digits individual square sum
		# 	#if already_visited_number?(squared_num) #check if its already visited
		# 	if squared_num == 4
		# 		@visited_numbers.push(squared_num)
		# 		return false
		# 	end
		# 	@visited_numbers.push(num) # push the visited number into the stack
		# 	happy_number_minner(squared_num)  # repeat for next number
		# else
		# 	@visited_numbers.push(num)
		# 	num == 1 && true || happy_number_minner(num)
		# end
		return true if num == 1
		squared_num = single_digit_squared(num.to_s)
		@visited_numbers << squared_num
		return false if squared_num == 4
		happy_number_minner(squared_num)
	end

	def is_happy_number?(a_num)
		happy_number_minner(a_num)
	end

	private

	def need_squared?(num)
		return true unless num == 1
	end

	def single_digit_squared(string_num)
		string_num.split('').reduce(0) {|sum, item| sum + get_square(item.to_i)}
	end

	def get_square(num)
		num*num
	end

	def already_visited_number?(num)
		@visited_numbers.include?(num)
	end
end

def happy_number?(num)
	happy_number = HappyNumberEngine.new()
	#print happy_number.is_happy_number?(num)
	#print happy_number.visited_numbers
	numbers = [1,2,3,4,5,6,7,8,9,10,44]
	numbers.each do |num|
		happy_number.visited_numbers = []
		print num,'--',happy_number.is_happy_number?(num),"--",happy_number.visited_numbers,"\n"
	end
end

if __FILE__ == $0
	print happy_number?(8)
end