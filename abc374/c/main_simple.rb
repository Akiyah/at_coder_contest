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
KS = STDIN.gets.chomp.split.map(&:to_i)

ks = KS.sort.reverse

pp ks if $debug

as = []
bs = []
a_sum = 0
b_sum = 0


ks.each do |k|
  if a_sum <= b_sum
    a_sum += k
    as << k
  else
    b_sum += k
    bs << k
  end
end

pp [as, a_sum] if $debug
pp [as, b_sum] if $debug

puts [a_sum, b_sum].max

