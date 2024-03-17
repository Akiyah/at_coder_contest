# require "ac-library-rb/segtree"

$debug = !ARGV[0].nil?

N, C = STDIN.gets.chomp.split.map(&:to_i)
#AS = (1..N).map { STDIN.gets.chomp.split.map(&:to_i) }.sort_by { |a, b| -a * b }
AS = STDIN.gets.chomp.split.map(&:to_i)
# pp AS

result0 = AS.sum
result = (0...N).to_a.combination(2).map do |l, r|
  # pp [l, r]
  x = AS.map.with_index do |a, i|
    (l <= i && i <= r) ? a * C : a
  end.sum
  x
end.max

puts [result0, result].max
