# N = 20 # 0000
# N = 200000
N = gets.chomp.to_i
puts N

(1...N).each do
  a = rand(1000000000)
  b = rand(1000000000)
  x = rand(N)
  puts [a, b, x].join(' ')
end

