# require "ac-library-rb/segtree"


N = gets.chomp.to_i
AS = gets.chomp.split.map(&:to_i)
M = gets.chomp.to_i
BS = gets.chomp.split.map(&:to_i)
L = gets.chomp.to_i
CS = gets.chomp.split.map(&:to_i)
Q = gets.chomp.to_i
XS = gets.chomp.split.map(&:to_i)

#pp XS.count

# abcs = Array.new(N * M * L)
# i = 0
abcs = AS.product(BS, CS).map(&:sum)

# pp abcs
abcs = abcs.uniq.sort.to_set
# pp abcs

# XS.each do |x|
#   abcs.include?(x) ? puts('Yes') : puts('No')
# end

puts XS.map { |x| abcs.include?(x) ? 'Yes' : 'No' }.join("\n")
