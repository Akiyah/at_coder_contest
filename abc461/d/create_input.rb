H = 100
W = 100
K = 0

puts [H, W, K].join(' ')

H.times do
  puts W.times.map { rand(2).to_s }.join('')
end
