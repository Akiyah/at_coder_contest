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

path = {}
AS.each.with_index do |a, i|
  path[a - 1] ||= []
  path[a - 1] << i
end

def count(i, path)
  vs = [i]
  while true
    vs_next = vs.dup
    vs.each do |v|
      vs_next += (path[v] || [])
      vs_next.uniq!
    end
    return vs.length unless vs.length < vs_next.length
    vs = vs_next
  end
end

c = 0
(0...N).each do |i|
  c0 = count(i, path)
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
