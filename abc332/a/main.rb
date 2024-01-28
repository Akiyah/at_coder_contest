n, s, k = gets.split.map(&:to_i)
pqs = (1..n).map do
  gets.split.map(&:to_i)
end

prices = pqs.map do |p, q|
  p * q
end
price = prices.sum

if s <= price
  puts price
else
  puts price + k
end

