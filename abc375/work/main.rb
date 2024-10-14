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
ABS = (1..N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end

def calc
  s = ABS.map { |a, b| b}.sum
  return -1 unless s % 3 == 0

  s_3 = s / 3

  dp = { 0 => { 0 => 0}}
  sum_b = 0
  pp dp if $debug
  ABS.each do |a, b|
    s_3_b = s_3 - b

    # pp [a, b, dp.length]
    dp_new = {}
    dp.each do |x, dp_x|
      # next unless x + x2 <= s / 3

      # dp_new[x + x2] ||= {}
      dp_new[x] ||= {}
      dp_new[x + b] ||= {}

      dp_x.each do |y, c|
        if a == 1 # もとの所属がxの場合
          cx = 0
          cy = 1
          cz = 1
        elsif a == 2 # もとの所属がyの場合
          cx = 1
          cy = 0
          cz = 1
        else # もとの所属がzの場合
          cx = 1
          cy = 1
          cz = 0
        end

        # x に追加の場合
        dp_new[x + b][y] = [c + cx, dp_new[x + b][y] || (c + cx)].min if x <= s_3_b

        # y に追加の場合
        dp_new[x][y + b] = [c + cy, dp_new[x][y + b] || (c + cy)].min if y <= s_3_b

        # z に追加の場合
        dp_new[x][y] = [c + cz, dp_new[x][y] || (c + cz)].min if sum_b - x - y <= s_3_b
      end
    end

    dp = dp_new
    sum_b += b
    pp dp if $debug
  end

  (dp[s / 3] && dp[s / 3][s / 3]) || -1
end

puts calc
