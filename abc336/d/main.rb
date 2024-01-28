n = gets.chomp.to_i
as = gets.chomp.split().map(&:to_i)

l = []
r = []

h = 0
as.each do |a|
  h = [h + 1, a].min
  l << h
end

h = 0
as.reverse.each do |a|
  h = [h + 1, a].min
  r << h
end
r = r.reverse

# pp l
# pp r

result = as.map.with_index do |a, i|
  [l[i], r[i]].min
end.max

puts result
