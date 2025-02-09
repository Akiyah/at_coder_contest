N = 100
M = N - 1

puts [N, M].join(' ')
(1..M).each do
  i = rand(M) + 1
  a = rand(N) + 1
  b = rand(N) + 1
  puts [i, a, b].join(' ')
end
