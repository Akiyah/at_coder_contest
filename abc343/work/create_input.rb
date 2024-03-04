N = 200000
Q = 200000

puts [N, Q].join(' ')

AS = (1..Q).map do
  rand(1000) + 1
end

puts AS.join(' ')

(1..Q).each do
  t = rand(2) + 1
  if t == 1
    p = rand(N) + 1
    x = rand(1000) + 1
    puts [1, p, x].join(' ')
  else
    l = rand(N) + 1
    r = rand(N) + 1
    l, r = r, l if r < l
    puts [2, l, r].join(' ')
  end
end

