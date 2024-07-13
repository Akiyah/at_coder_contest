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

R, G, B = STDIN.gets.chomp.split.map(&:to_i)
C = STDIN.gets.chomp

pp [R, G, B, C] if $debug

if C == 'Red'
  puts ([G, B]).min
end
if C == 'Green'
  puts ([R, B]).min
end
if C == 'Blue'
  puts ([R, G]).min
end
