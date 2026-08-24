
N = 10 ** 6
K = 5 * 10 ** 5





as = N.times.map { [0, 1].sample }
while as.sum < K
  as = N.times.map { [0, 1].sample }
end

puts [N, K].join(' ')
puts as.map{ |a| a == 0 ? 'x' : 'o' }.join('')


