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

# k = 0
cs = []
as.each.with_index do |a, i|
  pp as[(i + 1)..-1] if $debug
  ind = as[(i + 1)..-1].index{ |a2| M <= a2 + a }
  if ind.nil?
    cs[i] = 0
  else
    cs[i] = (N - 1) - (i + ind)
  end
end
#ds = as.map { |a| M <= a * 2 ? 1 : 0 }

pp cs if $debug
pp cs.sum if $debug
# pp ds if $debug
# pp ds.sum if $debug

sum = AS.sum

pp sum if $debug

r = ((N - 1) * sum) - (M * (cs.sum))

puts r
