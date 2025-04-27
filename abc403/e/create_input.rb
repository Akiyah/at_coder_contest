chars = ('a'..'z').to_a

puts 2 * 10 ** 4

(10 ** 4).times do |i|
  c1 = chars.sample
  c2 = chars.sample
  c3 = chars.sample
  c4 = chars.sample
  c5 = chars.sample

  puts [1, [c1, c2].join('')].join(' ')
  puts [2, [c3, c4, c5].join('')].join(' ')
end
