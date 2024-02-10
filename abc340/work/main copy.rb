N = gets.chomp.to_i

ABXS = (1...N).map do
  gets.chomp.split.map(&:to_i)
end

MIN_COST = []

def calc(i, cost)
  # pp [i, cost]
  # pp MIN_COST
  if i == N
    if MIN_COST[i] && MIN_COST[i] < cost
    else
      MIN_COST[i] = cost
    end
    return 0
  end

  if MIN_COST[i] && MIN_COST[i] < cost
  else
    MIN_COST[i] = cost
    a, b, x = ABXS[i - 1]
    calc(i + 1, cost + a)
    calc(x, cost + b)
  end
end

calc(1, 0)
#pp MIN_COST
puts MIN_COST[-1]
