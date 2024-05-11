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
as = AS.sort

pp as if $debug

M = 10 ** 8


def calc_c(as)
  c = 0
  i = 0
  j = N - 1
  pp [i, j, c] if $debug
  while i < j
    if as[i] + as[j] < M
      i += 1
    else
      c += (j - i)
      j -= 1
    end
    pp [i, j, c] if $debug
  end

  c
end

c = calc_c(as)
pp c if $debug

sum = AS.sum

pp sum if $debug

r = ((N - 1) * sum) - (M * c)

puts r
