# require "ac-library-rb/segtree"

$debug = !ARGV[0].nil?

N, Q = STDIN.gets.chomp.split.map(&:to_i)
TS = STDIN.gets.chomp.split.map(&:to_i)


result = TS.group_by(&:itself).transform_values(&:size).map { |k, v| v % 2 }.sum

puts N - result
