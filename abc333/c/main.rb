n = gets.chomp.to_i

d = [
  1,
  11,
  111,
  1111,
  11111,
  111111,
  1111111,
  11111111,
  111111111,
  1111111111,
  11111111111,
  111111111111
]


e = d.repeated_permutation(3).map(&:sum).uniq.sort

# p e

puts e[n - 1]
