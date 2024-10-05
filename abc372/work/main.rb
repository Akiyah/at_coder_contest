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


N = STDIN.gets.chomp.to_i
HS = STDIN.gets.chomp.split.map(&:to_i)

inf = 10 ** 6

seg = AcLibraryRb::Segtree.new(2 * 10 ** 5 + 1, inf) { |x, y| [x, y].min }


hs = HS.map.with_index do |h, i|
  [h, i]
end

rs = []
hs.reverse.each do |h, i|
  j = seg.prod(h, 2 * 10 ** 5 + 1) # indexが一番小さいもの
  seg.set(h, i)
  pp j if $debug
  # pp seg if $debug
  if j == inf
    rs[i] = 1
  else
    rs[i] = rs[j] + 1
  end
end

puts (rs[1..-1] + [0]).join(' ')
