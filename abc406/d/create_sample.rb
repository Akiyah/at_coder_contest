N = ARGV[0].to_i

H = N # 2 * 10 ** 5
W = N # 2 * 10 ** 5
Q = N # 2 * 10 ** 5

xys = {}
N.times do
  h = rand(H)
  w = rand(W)
  xys[h] ||= {}
  xys[h][w] = true
end

n = 0
xys.each do |x, ys|
  n += ys.length
end

puts [H, W, n].join(' ')

xys.each do |x, ys|
  ys.each do |y, v|
    puts [x, y].join(' ')
  end
end

puts Q

Q.times do
  t = [1, 2].sample
  if t == 1
    puts [t, rand(H)].join(' ')
  else
    puts [t, rand(W)].join(' ')
  end
end
