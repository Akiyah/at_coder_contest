# require "ac-library-rb/priority_queue"
require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"

$debug = !ARGV[0].nil?

# N = STDIN.gets.chomp.to_i
# N, A, X, Y = STDIN.gets.chomp.split.map(&:to_i)
# AS = (1..N).map do
#   STDIN.gets.chomp.to_i
#   STDIN.gets.chomp.split.map(&:to_i)
# end


S = STDIN.gets.chomp


i = S.split('').find_index('A') + 1 
c = 0
('BCDEFGHIJKLMNOPQRSTUVWXYZ').split('').each do |s|
  j = S.split('').find_index(s) + 1
  c += (i - j).abs
  i = j
end

puts c
