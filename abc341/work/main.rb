h, w, n = gets.chomp.split.map(&:to_i)
ts = gets.chomp.split('')
ss = (1..h).map do
  gets.chomp.split('').map { |s| s == '.' }
end

# pp ss

points = []
(0...h).each do |i|
  (0...w).each do |j|
    points << [i, j] if ss[i][j]
  end
end

ds = []
di = dj = 0
ts.each do |t|
  case t
  when 'U'
    di -= 1
  when 'D'
    di += 1
  when 'L'
    dj -= 1
  when 'R'
    dj += 1
  end

  ds << [di, dj]
end

def check(i, j, ts, ss, ds)
  ds.each do |di, dj|
    return false unless ss[i + di][j + dj]
  end

  true
end

# pp ds

# pp ss
# pp points

results = points.select do |i, j| check(i, j, ts, ss, ds) end

puts results.count
