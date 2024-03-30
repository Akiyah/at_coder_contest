# require "ac-library-rb/segtree"

$debug = !ARGV[0].nil?

N, K = STDIN.gets.chomp.split.map(&:to_i)
AS = STDIN.gets.chomp.split.map(&:to_i)

puts AS.select { |a| a % K == 0 }.map { |a| a / K }.sort.join(' ')
