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

S = STDIN.gets.chomp

ss = S.split('')
n = ss.length

ss2 = ss.zip((0...n))

ss3 = ss2.group_by { |s, i| s }

pp ss3 if $debug

r = ss3.map do |k, ss|
  is = ss.map { |s, i| i }

  is.sum { |i| is.sum { |j| i < j ? j - i - 1 : 0 } }
end.sum

puts r
