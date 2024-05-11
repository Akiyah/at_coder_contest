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

N, K = STDIN.gets.chomp.split.map(&:to_i)
AS = STDIN.gets.chomp.split.map(&:to_i)


def calc(n, k, as)
  i = 0
  m = 0
  as.each do |a|
    if m + a <= k
      m += a
    else
      i += 1
      m = a
    end
    pp [i, a, m] if $debug
  end

  i + 1
end

puts calc(N, K, AS)
