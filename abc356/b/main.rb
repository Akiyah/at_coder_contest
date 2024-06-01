# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"

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
XS = (1..N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end

pp N, M, AS, XS if $debug


bs = Array.new(M, 0)
XS.each do |xs|
  xs.each.with_index do |x, i|
    bs[i] += x
  end
end

pp bs if $debug

def check(bs)
  bs.each.with_index do |b, i|
    return false unless AS[i] <= b 
  end
  true
end


puts  check(bs) ? "Yes" : "No"


