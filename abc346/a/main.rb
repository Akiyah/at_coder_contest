# require "ac-library-rb/segtree"

$debug = !ARGV[0].nil?

N = STDIN.gets.chomp.to_i
AS = STDIN.gets.chomp.split.map(&:to_i)

puts (0...(N - 1)).map { |i| AS[i] * AS[i + 1] }.join(' ')
