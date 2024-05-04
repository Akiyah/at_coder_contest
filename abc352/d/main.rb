# require "ac-library-rb/priority_queue"
require "ac-library-rb/segtree"

$debug = !ARGV[0].nil?

# N = STDIN.gets.chomp.to_i
# N, A, X, Y = STDIN.gets.chomp.split.map(&:to_i)
# AS = (1..N).map do
#   STDIN.gets.chomp.to_i
#   STDIN.gets.chomp.split.map(&:to_i)
# end

N, K = STDIN.gets.chomp.split.map(&:to_i)
PS = STDIN.gets.chomp.split.map(&:to_i)

ps = PS.map do |p|
  p - 1
end

rs = []
ps.each.with_index do |p, i|
  rs[p] = i
end

pp PS if $debug
pp ps if $debug
pp rs if $debug

inf = (1 << 60) - 1
seg_max = AcLibraryRb::Segtree.new(rs, -inf) { |x, y| [x, y].max }
seg_min = AcLibraryRb::Segtree.new(rs, inf) { |x, y| [x, y].min }

is_min = N
(0..(N - K)).each do |i|
  #is = rs[i...(i + K)]

  m1 = seg_max.prod(i, i + K)
  m2 = seg_min.prod(i, i + K)
  pp [i, i + K, m1, m2] if $debug
  is_min = [is_min, m1 - m2].min
end

puts is_min
