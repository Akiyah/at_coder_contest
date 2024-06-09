# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
require "ac-library-rb/dsu"

$debug = !ARGV[0].nil?

# N = STDIN.gets.chomp.to_i
# N, A, X, Y = STDIN.gets.chomp.split.map(&:to_i)
# AS = (1..N).map do
#   STDIN.gets.chomp.to_i
#   STDIN.gets.chomp.split.map(&:to_i)
# end

# inf = (1 << 60) - 1
# seg_max = AcLibraryRb::Segtree.new(rs, -inf) { |x, y| [x, y].max }


N = STDIN.gets.chomp.to_i
AS = STDIN.gets.chomp.split.map(&:to_i)

def count(i)
  v = i
  vs = [v]
  
  while true
    pp [v, vs] if $debug
    w = AS[v - 1]
    if vs.include?(w)
      return vs.length
    end
    vs << w
    v = w
  end
end

c = 0
(1..N).each do |i|
  c0 = count(i)
  pp [i, c0] if $debug
  c += c0
end

puts c







# def calc_group(g)
# end

# def calc
#   dsu = AcLibraryRb::DSU.new(N)

#   AS.each.with_index do |a, i|
#     dsu.merge(a - 1, i)
#   end
  
#   pp dsu.groups if $debug
#   dsu.groups.each do |g|
#     calc_group(g)
#   end
# end

# puts calc
