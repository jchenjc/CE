def fib_even_sum(n)
	res = 0
	fib = [0,1]
	counter = 0
	while 1
		fib << fib[counter] + fib[counter+1]
		if fib[-1] > n 
			fib.pop
			break
		end
		res += fib[-1] if fib[-1].even?
		counter += 1
	end
	# p fib
	p res
end

fib_even_sum(4_000_000)

def fib_even_sum_better(n)
	res = 0
	f1 = 1
	f2 = 2
	
	while f2 < n
		res += f2 if f2.even?
		f1, f2 = f2, f1 + f2
	end
	
	p res
end

fib_even_sum_better(4_000_000)
