require "ac-library-rb/priority_queue"
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
AS = STDIN.gets.chomp.split.map(&:to_i)
AS2 = AS.zip(0...N)

R = 998244353

def calc
  if N == 1
    return [N]
  end
  if N == 2
    return [N, N * (N - 1) / 2]
  end

  rs = [N, N * (N - 1) / 2]


  dp = Array.new(N) { Hash.new(0) } # i番目が最後になっている、step dの等差数列の数
  (1...N).map do |i|
    ((i + 1)..N).map do |j|
      d = AS[j - 1] - AS[i - 1]
      dp[j - 1][d] += 1
    end
  end

  pp dp if $debug

  (3..N).map do |i|
    dp_new = Array.new(N) { Hash.new(0) } # i番目が最後になっている、step dの等差数列の数
    r = 0

    dp.each_with_index do |h, i|
      pp [h, i] if $debug
      h.each do |d, c|
        pp ['d', d, 'c', c] if $debug
        AS2[(i + 1)..-1].select { |a, j| a == AS[i] + d }.each do |a, j|
          pp [i, d, a, j, c] if $debug
          dp_new[j][d] += c
          r += c
        end
      end
    end

    rs << r % R
    dp = dp_new
  end
  rs
end


rs = calc
puts rs.join(' ')
