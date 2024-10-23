N = 3000
# Q = 3000
Q = 300

puts [N, Q].join(' ')
(1..Q).each do |i|
  # h = (rand(2) == 0 ? 'L' : 'R')
  h = 'L'
  t = rand(N) + 1
  puts [h, t].join(' ')
end
