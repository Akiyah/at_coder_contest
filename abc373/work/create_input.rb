N = (10 ** 5)
# N = (10 ** 3)
# N = (10 ** 4)


abs = []

(1...N).each do |i|
  abs << [i, i + 1]  
end

puts [N, 2].join(' ')
abs.each do |a, b|
  puts [a, b].join(' ')  
end
puts [1, N].join(' ')
