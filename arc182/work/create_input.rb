N = 5000
Q = 100


puts [N, Q].join(' ')
v = 0
(1..Q).each do |q|
  p = rand(1..N)
  v += 1
  puts [p, v].join(' ')  
end
