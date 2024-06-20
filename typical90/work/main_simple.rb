# require "ac-library-rb/segtree"

$debug = !ARGV[0].nil?

N = STDIN.gets.chomp.to_i
AS = STDIN.gets.chomp.split.map(&:to_i)
Q = STDIN.gets.chomp.to_i
BS = (1..Q).map do
  STDIN.gets.chomp.to_i
end

BS.each do |b|
  r = AS.map { |a| (a - b).abs }.min
  puts r
end


