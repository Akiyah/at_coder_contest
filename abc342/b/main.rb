N = gets.chomp.to_i
PS = gets.chomp.split.map(&:to_i)
Q = gets.chomp.to_i
ABS = (1..Q).map do
  gets.chomp.split.map(&:to_i)
end

ABS.each do |a, b|
  puts PS.find_index(a) < PS.find_index(b) ? a : b
end
