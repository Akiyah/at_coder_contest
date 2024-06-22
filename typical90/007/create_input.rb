N = 300000
Q = 300000

as = (1..N).map { rand(10**9) }
bs = (1..N).map { rand(10**9) }

puts N
puts as.join(' ')
puts Q
bs.each { |b| puts b }
