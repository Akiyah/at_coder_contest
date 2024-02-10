N = gets.chomp.to_i

ABXS = (1...N).map do
  gets.chomp.split.map(&:to_i)
end

MIN_COST = []
MIN_COST[1] = 0


# a step
(1..N).each do |i|
  a, b, x = ABXS[i - 1]

  if i < N
    MIN_COST[i + 1] = MIN_COST[i] + a
  end
end

# b step
(1..N).each do |i|
  a, b, x = ABXS[i - 1]

  if 1 < i
    MIN_COST[i] = MIN_COST[i - 1] + a
  end
end


# def calc(i, cost)
#   # pp [i, cost]
#   # pp MIN_COST
#   if i == N
#     if MIN_COST[i] && MIN_COST[i] < cost
#     else
#       MIN_COST[i] = cost
#     end
#     return 0
#   end

#   if MIN_COST[i] && MIN_COST[i] < cost
#   else
#     MIN_COST[i] = cost
#     a, b, x = ABXS[i - 1]
#     calc(i + 1, cost + a)
#     calc(x, cost + b)
#   end
# end

calc(1, 0)
#pp MIN_COST
puts MIN_COST[-1]
