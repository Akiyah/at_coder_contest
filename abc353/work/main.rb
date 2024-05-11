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
AS = STDIN.gets.chomp.split.map(&:to_i)

M = 998244353


def calc(as)
  s = 0
  si_sum = 0
  (0...(N - 1)).each do |i|
    si_sum += as[i]
    aj = as[i + 1]
    pp [si_sum, aj] if $debug
    pp (si_sum.to_s + aj.to_s).to_i if $debug
    k = aj.to_s.length

    s += (si_sum * (10 ** k) + aj * (i + 1)) % M
  end
  s % M
end

r = calc(AS)

puts r
