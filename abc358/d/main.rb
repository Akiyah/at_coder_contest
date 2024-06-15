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


N, M = STDIN.gets.chomp.split.map(&:to_i)
AS = STDIN.gets.chomp.split.map(&:to_i)
BS = STDIN.gets.chomp.split.map(&:to_i)

as = AS.sort
bs = BS.sort


pp [as, bs] if $debug

def count(as, bs)
  coin = 0
  while true
    return coin if bs.empty?
    return -1 if as.empty?

    b = bs.shift
    i = as.find_index { |a| b <= a}
    
    pp [b, i, as[i]] if $debug

    if i == nil
      return -1
    end

    coin += as[i]
    as = as[(i + 1)..-1]
  end

  coin
end

puts count(as, bs)
