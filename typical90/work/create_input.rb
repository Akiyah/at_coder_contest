N = 100000
K = 1000

S = ('a'..'z').to_a.sample(K).join('')

puts [N, K].join(' ')
puts S
