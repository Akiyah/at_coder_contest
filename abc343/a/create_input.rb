# N = 200000
N = gets.chomp.to_i
M = N - 1

puts [N, M].join(' ')

(1..M).each do |i|
  l = rand(1000000000)
  d = rand(1000000000)
  k = rand(1000000000)
  c = rand(1000000000)
  a = i # rand(1..N)
  b = i + 1 # rand(1..N)
  # while a == b do
  #   b = rand(1..N)
  # end
  puts [l, d, k, c, a, b].join(' ')
end

