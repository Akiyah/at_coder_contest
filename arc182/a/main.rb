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

R = 998244353

N, Q = STDIN.gets.chomp.split.map(&:to_i)
PVS = (1..Q).map do
  STDIN.gets.chomp.split.map(&:to_i)
end

def count
  dp = {}
  dp[[0] * N] = 1

  PVS.each do |p, v|
    dp_new = Hash.new(0)
    dp.each do |s, c|
      # unless v < s[0..(p - 1)].max
      if s[0] <= v && s[p - 1] <= v
        s_new = [v] * p + s[(p)..(-1)]
        dp_new[s_new] = (dp_new[s_new] + c) % R
      end
      # unless v < s[(p - 1)..(-1)].max
      if s[p - 1] <= v && s[-1] <= v
        s_new = s[0...(p - 1)] + [v] * (N - p + 1)
        dp_new[s_new] = (dp_new[s_new] + c) % R
      end
    end
    dp = dp_new

    # pp dp if $debug
    # pp dp.values.map{|sc| sc[1]}.sum if $debug
    pp dp.keys.count if $debug
  end

  dp.values.sum
end



puts count % R
