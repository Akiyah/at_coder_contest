chars = ('a'..'z').to_a

puts 2 * 10 ** 4 * 5

(10 ** 4 * 5).times do |i|
  c1 = (1..4).map { chars.sample }
  c2 = (1..6).map { chars.sample }

  puts [1, c1.join('')].join(' ')
  puts [2, c2.join('')].join(' ')
end
