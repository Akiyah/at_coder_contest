
X = (10 ** 4).times.map { ('a'..'z').to_a.sample }.join('')
Y = (10 ** 4).times.map { ('a'..'z').to_a.sample }.join('')

puts X
puts Y

Q = 10 ** 5

puts Q

L = 10 ** 18
R = 10 ** 18

Q.times do
  puts [L, R, ('a'..'z').to_a.sample].join(' ')
end
