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


  dp = { 0 => { 0 => 0}}
  sum_b = 0
  pp dp if $debug
  ABS.each do |a, b|
    dp_new = {}
    [1, 2, 3].each do |a2|
      c2 = (a2 == a ? 0 : 1)
      x2 = (a2 == 1 ? b : 0)
      y2 = (a2 == 2 ? b : 0)
      z2 = (a2 == 3 ? b : 0)
      dp.each do |x, dp_x|
        dp_x.each do |y, c|
          z = sum_b - x - y
          if x + x2 <= s / 3 && y + y2 <= s / 3 && z + z2 <= s / 3
            dp_new[x + x2] ||= {}
            d = dp_new[x + x2][y + y2]
            dp_new[x + x2][y + y2] = (d ? [c + c2, d].min : c + c2)
          end
        end
      end
    end

    dp = dp_new
    sum_b += b
    pp dp if $debug
  end

  (dp[s / 3] && dp[s / 3][s / 3]) || -1
end

puts calc
