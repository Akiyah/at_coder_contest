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

$cache_count = []
def count(n)
  return $cache_count[n] if $cache_count[n]

  i = 0
  v = n

  vs = []
  v_index = {}

  v_index[v] = i
  vs << v
  i += 1

  loop do
    pp [v, vs] if $debug
    v2 = AS[v - 1]

    if $cache_count[v2]
      vs.each.with_index do |w, j|
        $cache_count[w] = $cache_count[v2] + i - j
      end
      return $cache_count[n]
    end

    if v_index[v2] != nil # 今回のパスに届いた
      i2 = v_index[v2]
      vs[i2..-1].each do |w|
        $cache_count[w] = i - i2
      end

      vs[0...i2].each.with_index do |w, j|
        $cache_count[w] = $cache_count[v2] + i2 - j
      end

      return $cache_count[n]
    end
    v_index[v2] = i
    vs << v2
    i += 1
    v = v2
  end
end

c = 0
(1..N).each do |n|
  c0 = count(n)
  pp [n, c0] if $debug
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
