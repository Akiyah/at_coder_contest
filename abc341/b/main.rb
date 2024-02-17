n = gets.chomp.to_i
as = gets.chomp.split.map(&:to_i)
sts = (1...n).map do |i|
  gets.chomp.split.map(&:to_i)
end



(0...(n - 1)).each do |i|
  r = as[i] / sts[i][0]
  as[i] -= r * sts[i][0]
  as[i + 1] += r * sts[i][1]
end

puts as[n - 1]
