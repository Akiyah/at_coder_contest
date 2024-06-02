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

N, K = STDIN.gets.chomp.split.map(&:to_i)
AS = STDIN.gets.chomp.split.map(&:to_i)

def s(as)
  bs = [0]
  b = 0
  as.each_with_index do |a, i|
    b += a
    bs[i + 1] = b
  end
  bs
end


def check
  b0 = 0
  bn = AS.sum

  as = AS.sort # 下ルート

  if b0 <= bn
    if K <= b0
      # yes 上ルート
      return as.reverse
    else # b0 < K
      # yes 下ルート
      return as
    end
  else # bn < b0
    if b0 < K
      # yes 下ルート
      return as
    elsif K <= bn
      # yes 上ルート
      return as.reverse
    else # bn < K <= b0
      # no
      return false
    end
  end
end

r = check
if r
  pp s(r) if $debug
  puts 'Yes'
  puts r.join(" ")
else
  puts 'No'
end