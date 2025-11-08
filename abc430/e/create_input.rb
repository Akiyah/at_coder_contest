puts 1

n = 6

A = '1' + ('0' * (10 ** n - 1))
B = A[-1] + A[0...-1]

puts A
puts B

