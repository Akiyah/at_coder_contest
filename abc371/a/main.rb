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


SAB, SAC, SBC = STDIN.gets.chomp.split

r = nil
if SAB == '<'
  if SAC == '<'
    r = SBC == '<' ? 'B' : 'C'
  else
    r = 'A'
  end
else
  if SAC == '<'
    r = 'A'
  else
    r = SBC == '<' ? 'C' : 'B'
  end
end

puts r
