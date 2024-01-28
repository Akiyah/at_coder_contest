N, M = gets.chomp.split.map(&:to_i)
XS = gets.chomp.split.map(&:to_i).map { |i| i - 1}

data = Array.new(N, 0)

l_min = 0
(M - 1).times do |i|
  #pp "---"
  #pp i
  x = XS[i]
  y = XS[(i + 1) % N]
  #pp [x, y]

  x, y = [x, y].min, [x, y].max
  #pp [x, y]

  l = (y - x).abs
  #pp l
  if N - l < l
    x, y = y, x + N
  end
  #pp [x, y]
  #pp [x % N, y % N]

  d = y - x
  l_min += d
  d2 = (N - d) - d
  (x...y).each do |j|
    data[j % N] += d2
  end
  #pp data
end

#pp l_min
#pp data

puts l_min + data.min