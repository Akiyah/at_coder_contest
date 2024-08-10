N = (10 ** 5)
# N = (10 ** 3)
# N = (10 ** 4)


as = []
bks = []

(1..N).each do |i|
  as << i * 2
  bks << [i * 2 + 1, i]  
end

puts [N, N].join(' ')
puts as.join(' ')
bks.each do |b, k|
  puts [b, k].join(' ')  
end
