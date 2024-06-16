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


K = STDIN.gets.chomp.to_i
CS = STDIN.gets.chomp.split.map(&:to_i)

R = 998244353

def create_one(c) # 一文字分, cは使っていい文字数
  (0..K).map do |k|
    c < k ? 0 : 1
  end
end

$factorial = [1] # n!
(1..1000).each do |i|
  $factorial[i] = ($factorial[i - 1] * i) % R
end

$inverse_factorial = [] # 1/n!
(0..1000).each do |i|
  $inverse_factorial[i] = $factorial[i].pow(R - 2, R) % R
end

$cache_count_combination = []
def count_combination(n, m) # (n+m)Cm
  m = n - m if n < m * 2

  if $cache_count_combination[n] && $cache_count_combination[n][m]
    return $cache_count_combination[n][m]
  end

  $cache_count_combination[n] ||= []

  r = $factorial[n] * $inverse_factorial[n - m] * $inverse_factorial[m]
  # r = $factorial[n] / $factorial[n - m] / $factorial[m]
  $cache_count_combination[n][m] = r % R
  return $cache_count_combination[n][m]
end

def product(rs1, rs2)
  (0..K).map do |k|
    (0..k).sum do |i|
      j = k - i
      # pp [k, i, j, rs1[j], rs2[i], count_combination(k, i)] if $debug
      rs1[j] * rs2[i] * count_combination(k, i) % R
    end
  end
end

def calc # 一文字ずつ足していく
  rs = Array.new(K + 1, 0)
  rs[0] = 1
  # pp rs if $debug
  CS.each do |c|
    next if c == 0
    rs2 = create_one(c)
    rs = product(rs, rs2)
    # pp rs if $debug
  end
  rs[1..-1].sum
end

puts calc % R

if $debug
  pp $cache_count_combination.length
  pp $cache_count_combination[0..10]
end

# irb(main):011> (1..1000).sum {|k| 26.pow(k, 998244353) } % 998244353
# => 270274035