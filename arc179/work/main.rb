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

M, N = STDIN.gets.chomp.split.map(&:to_i)
XS = STDIN.gets.chomp.split.map(&:to_i)

R = 998244353

rxs = Hash.new { |hash, key| hash[key] = [] }
XS.zip(1..N).each do |x, i|
  rxs[x] << i
end

pp rxs if $debug

iss = (0...(2 ** M)).map do |ds|
  ds.digits(2).zip(1..M).select { |d, i| d != 0 }.map { |d, i| i }
end

pp iss if $debug


def count(rxs, iss)
  dp = Hash.new(0)
  dp[(1..M).to_a] = 1 # first status
  pp dp if $debug

  (1..N).each do |i|
    dp_next = Hash.new(0)
    iss.each do |is|
      n = dp[is]
      if 0 < n
        is.each do |i|
          is2 = (is - [i] + rxs[i]).uniq.sort
          pp [i, is, is2] if $debug
          dp_next[is2] += n
        end
      end
    end
    dp = dp_next
    pp dp if $debug
  end

  dp.sum { |k, v| v }
end

puts count(rxs, iss) % R
