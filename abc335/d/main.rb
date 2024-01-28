n = gets.chomp.to_i

m = (n - 1) / 2

data = (1..n).map do
  (1..n).map do
    ''
  end
end

data[m][m] = 'T'

# pp m
# pp data

(1..m).each do |i|
  # pp i

  # 左（↓）
  (0...(i * 2)).each do |j|
    data[m - i + 1 + j][m - i] = j + 1 + (i * 2) * 0 + ((i * 2 - 1)**2 - 1)
    # pp data
  end

  # 下（→）
  (0...(i * 2)).each do |j|
    data[m + i][m - i + 1 + j] = j + 1 + (i * 2) * 1 + ((i * 2 - 1)**2 - 1)
    # pp data
  end

  # 右（↑）
  (0...(i * 2)).each do |j|
    data[m + i - 1 - j][m + i] = j + 1 + (i * 2) * 2 + ((i * 2 - 1)**2 - 1)
    # pp data
  end

  # 上（←）
  (0...(i * 2)).each do |j|
    data[m - i][m + i - 1 - j] = j + 1 + (i * 2) * 3 + ((i * 2 - 1)**2 - 1)
    # pp data
  end

end

# pp data
data.each do |d|
  puts d.join(' ')
end