N = 2 * 10 ** 4

puts [N, N - 1].join(' ')
(1...N).each do |i|
  puts [i, i + 1].join(' ')
end
