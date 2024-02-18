H, W, N = gets.chomp.split.map(&:to_i)
TS = gets.chomp.split('')
SS = (1..H).map do
  gets.chomp.split('').map { |s| s == '.' }
end.flatten

# pp SS

points = []
(0...H).each do |i|
  (0...W).each do |j|
    # points << [i, j] if SS[i][j]
    points << [i, j] if SS[i * W + j]
  end
end

DS = []
di = dj = 0
TS.each do |t|
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

  DS << [di, dj]
end

def check(i, j)
  DS.each do |di, dj|
    # return false unleSS SS[i + di][j + dj]
    return false unless SS[(i + di) * W + (j + dj)]
  end

  true
end

# pp DS

# pp SS
# pp points

results = points.select do |i, j| check(i, j) end

puts results.count
