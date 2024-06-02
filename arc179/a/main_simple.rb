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
  AS.permutation(N).each do |as|
    bs = s(as)
    i1 = bs.rindex { |b| b < K }
    i2 = bs.find_index { |b| K <= b }
    pp [as, bs, i1, i2] if $debug
    if i1 == nil || i2 == nil || i1 < i2
      return as
    end
  end
  nil
end

r = check
if r
  puts 'Yes'
  puts r.join(" ")
else
  puts 'No'
end