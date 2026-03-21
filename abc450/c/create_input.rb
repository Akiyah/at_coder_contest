
H = 12
W = 12
SS = (1..H).map do
  '.' * W
end

puts [H, W].join(' ')
SS.each do |line|
  puts line
end
