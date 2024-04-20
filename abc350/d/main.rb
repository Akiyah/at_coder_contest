require "ac-library-rb/dsu"

$debug = !ARGV[0].nil?

N, M = STDIN.gets.chomp.split.map(&:to_i)
ABS = (1..M).map do
  STDIN.gets.chomp.split.map(&:to_i)
end


dsu = AcLibraryRb::DSU.new(N)

ABS.each do |a, b|
  dsu.merge(a - 1, b - 1)
end

pp dsu.groups if $debug

lines = 0
dsu.groups.each do |g|
  pp g if $debug
  pp g.size if $debug
  n = g.size
  lines += n * (n - 1) / 2
end

puts lines - M
