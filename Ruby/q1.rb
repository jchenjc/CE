def sum_num(n)
	res = 0
	(1..n-1).each do |i|
		res += i if i % 3 == 0 || i % 5 == 0	
	end
	res
end

puts sum_num(1000)
