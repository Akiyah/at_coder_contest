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
HS = STDIN.gets.chomp.split.map(&:to_i)

is = (1...N).map { |i| HS[0] < HS[i] ? i : nil }.compact

if is.empty?
  puts -1
else
  puts is[0] + 1
end
