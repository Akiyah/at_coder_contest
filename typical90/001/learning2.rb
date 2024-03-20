N = 3
L = 6

AS = [2, 3, 4]


# K = 1
result1 = AS.combination(1).map do |as|
  as = ([0] + as + [L])
  (0..1).map { |i| as[i + 1] - as[i] }.min
end.max
pp result1
x1 = AS.combination(1).select do |as|
  as = ([0] + as + [L])
  (0..1).map { |i| as[i + 1] - as[i] }.min == result1
end
pp x1

# K = 2
result2 = AS.combination(2).map do |as|
  as = ([0] + as + [L])
  (0..2).map { |i| as[i + 1] - as[i] }.min
end.max
pp result2
x2 = AS.combination(2).select do |as|
  as = ([0] + as + [L])
  (0..2).map { |i| as[i + 1] - as[i] }.min == result2
end
pp x2

