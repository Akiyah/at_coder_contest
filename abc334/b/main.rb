a, m, l, r = gets.split(' ').map(&:to_i)

r2 = r - a
l2 = l - a

if r2 % m == 0
  r3 = r2 / m
else
  r3 = r2 / m # floor
end

if l2 % m == 0
  l3 = l2 / m
else
  l3 = (l2 / m) + 1 # ceil
end

# pp [l3, r3]

if l3 > r3
  if l2 % m == 0
    puts 1
  else
    puts 0
  end
elsif l3 == r3
  if r2 % m != 0 || l2 % m != 0
    puts 1
  else
    puts 0
  end
else
  puts r3 - l3 + 1
end
