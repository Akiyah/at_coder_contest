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

N = STDIN.gets.chomp.to_i
KS = STDIN.gets.chomp.split.map(&:to_i)


k_sum = KS.sum

def sum(d)
  (0...N).map do |i|
    d[i] * KS[i]
  end.sum
end


m = k_sum
(0..(2 ** (N - 1))).each do |d2|
  d = d2 * 2 # 1桁目は0にして計算を短くする
  s = sum(d)
  m = [m, [s, k_sum - s].max].min
end

puts m
