n = gets.chomp.to_i
as = gets.chomp.split.map(&:to_i)

path = []

as.each_with_index do |a, i|
  if a == -1
    path[0] = i + 1
  else
    path[a] = i + 1
  end
end

results = [0]
(path.length).times do |i|
  results[i + 1] = path[results[i]]
end

# pp results.compact
puts results[1..-1].compact.join(' ')