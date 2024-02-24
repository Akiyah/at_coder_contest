N = gets.chomp.to_i
S = gets.chomp
Q = gets.chomp.to_i
CDS = (1..Q).map do
  gets.chomp.split
end


chars_rev = {}
# pp chars_rev
('a'..'z').each do |c|
  # chars[c] = c
  chars_rev[c] = [c]
end

CDS.each do |c, d|
  next if c == d
  # chars[c] = d

  chars_rev[d] += chars_rev[c]
  chars_rev[c] = []
  # pp chars_rev
end

chars = {}
chars_rev.each do |k, v|
  v.each do |c|
    chars[c] = k
  end
end

# pp chars

result = S.split('').map do |c|
  chars[c]
end.join('')

puts result