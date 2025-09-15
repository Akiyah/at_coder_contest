N = 3 * 10 ** 4
Q = 3 * 10 ** 4

AS = N.times.map { rand(100) + 1 }
LRS = Q.times.map do
  l = rand(N) + 1
  r = rand(N) + 1
  l, r = r, l unless l < r
  [l, r]
end


puts [N, Q].join(' ')
puts AS.join(' ')
LRS.each do  |l, r|
  puts [l, r].join(' ')
end 
