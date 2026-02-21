T = 1
# N = 5 * 10 ** 5
N = 5 * 10 ** 3

AS = N.times.map { |i| rand(1..(10 ** 7)) }


puts T
puts N
puts AS.join(' ')

