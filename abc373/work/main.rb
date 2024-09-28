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

N, M, K = STDIN.gets.chomp.split.map(&:to_i)
AS = STDIN.gets.chomp.split.map(&:to_i)
R = K - AS.sum

pp [N, M, K, AS] if $debug
pp R if $debug


def calc
  rs = (0...N).map do |i|
    a = AS[i]
    as = AS[0...i] + AS[(i + 1)...N]
    bs = as.sort.reverse[0...M]
    bs_sum = bs.sum
    b = bs[-1]

    x = 0
    r = R
    if a < bs[-1]
      x += bs[-1] - a
      r -= bs[-1] - a
    end
    if 0 < r / (M + 1)
      r -= (r / (M + 1)) * (M + 1)
    end
    


    r = R - (M * b - bs_sum)

  end

  rs
end


rs = calc
purs rs.join(' ')
