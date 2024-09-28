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


SS = (1..12).map do
  STDIN.gets.chomp
end

c = 0
SS.each_with_index do |s, i|
  pp [s, i, s.length] if $debug
  c += 1 if s.length == i + 1
end


puts c
