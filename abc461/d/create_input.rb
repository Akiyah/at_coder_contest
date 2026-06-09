H = 300
W = 300
K = 0

puts [H, W, K].join(' ')

H.times do
  puts W.times.map { rand(2).to_s }.join('')
end
