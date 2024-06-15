# require "ac-library-rb/segtree"

$debug = !ARGV[0].nil?

N, B, K = STDIN.gets.chomp.split.map(&:to_i)
CS = STDIN.gets.chomp.split.map(&:to_i)

M = 10 ** 9 + 7

# r = CS.repeated_permutation(N).count do |cs|
#   cs.map.with_index { |c, i| c * (10 ** i) }.sum % B == 0
# end

# 桁DP
def check
  dp = {}

  dp[0] ||= []
  dp[0][0] = 1

  (1..N).each do |digit|
    dp[digit] ||= []

    (0...B).each do |reminder|
      d = (10 ** (digit - 1)) % B
      r = CS.map do |c|
        reminder2 = (reminder + c * d) % B
        # pp dp
        dp[digit - 1][reminder2] || 0
      end.sum
      dp[digit][reminder] = r % M
    end
  end

  dp[N][0]
end

puts check
