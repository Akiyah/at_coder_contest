N, M = gets.chomp.split.map(&:to_i)
XS = gets.chomp.split.map(&:to_i).map { |i| i - 1}

cost_min = 0
cost_diff = Array.new(N, 0)
cost_total = Array.new(N, 0)
(1...M).each do |i|
  #pp "---#{i}---"
  x = XS[i - 1]
  y = XS[i]
  #pp [x, y]

  x, y = y, x if y < x

  l = y - x # 0 < l
  if N - l < l
    # y -> (N - 1) -> 0 -> x と、N番目の橋を渡る場合
    d = N - l
    d2 = (N - d) - d
    #pp [x, y, d, d2]
    #pp cost_diff
    cost_diff[y] += d2
    #pp cost_diff
    if x > 0
      #pp "if x > 0"
      cost_diff[0] += d2
      cost_diff[x] += -d2
    end

    cost_min += d
  else
    # x -> y と、N番目の橋を渡らない場合
    d = l
    d2 = (N - d) - d
    cost_diff[x] += d2
    cost_diff[y] += -d2

    cost_min += d
  end

  #pp cost_min
  #pp cost_diff
end

#pp cost_min
#pp cost_diff

N.times do |j|
  if j == 0
    cost_total[j] = cost_min + cost_diff[j]
  else
    cost_total[j] = cost_total[j - 1] + cost_diff[j]
  end
end
# pp cost_total


puts cost_total.min