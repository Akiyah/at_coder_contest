N = 10 ** 5

puts N

N.times do |n|
  puts 6.times.map { rand(10 ** 9) }.join(' ')
end

