N = 3 * 10 ** 5

puts N

N.times do |i|
  puts [i, 1 + rand(10 ** 9)].join(' ')
end
