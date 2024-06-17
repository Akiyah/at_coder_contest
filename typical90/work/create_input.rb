N = 100000
K = 1000


S = (1..N).map do 
  ('a'..'z').to_a.sample(1)
end.join('')

puts [N, K].join(' ')
puts S
