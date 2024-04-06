# require "ac-library-rb/segtree"

$debug = !ARGV[0].nil?

# A, B, C = STDIN.gets.chomp.split.map(&:to_i)
N = STDIN.gets.chomp.to_i

s = (1..N).map do |i|
  i % 3 == 0 ? 'x' : 'o'
end.join('')

puts s