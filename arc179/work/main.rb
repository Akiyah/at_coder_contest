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
XS.zip(1..).each do |x, i|
  rxs[x] << i
end

pp rxs if $debug

iss = (0...(2 ** M)).map do |ds|
  ds.digits(2).zip(1..M).select { |d, i| d != 0 }.map { |d, i| i }
end

# pp iss if $debug

def is2n(is)
  is.sum { |i| 2 ** (i - 1) }
end

def n2is(n)
  n.digits(2).zip(1..).select { |d, i| 0 < d }.map { |d, i| i }.uniq.sort
end

$n_2_n2 = {}
iss.each do |is|
  $n_2_n2[is2n(is)] ||= {}
  is.each do |i|
    $n_2_n2[is2n(is)][i] = is2n((is - [i] + rxs[i]).uniq)
  end
end

# pp $n_2_n2 if $debug

def count(rxs, iss)
  dp = Array.new(2 ** M, 0)
  dp[is2n(1..M)] = 1 # first status
  # pp dp if $debug

  (1..N).each do |i|
    pp i if $debug
    dp_next = Array.new(2 ** M, 0)
    (0...(2 ** M)).each do |n|
      c = dp[n]
      $n_2_n2[n].each do |i, n2|
        dp_next[n2] = (dp_next[n2] + c) % R
        #dp_next[n2] %= R
      end
    end
    dp = dp_next
    # pp dp if $debug
  end

  dp.sum % R
end

puts count(rxs, iss)
