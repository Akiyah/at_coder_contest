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


L, R = STDIN.gets.chomp.split.map(&:to_i)

if L == 1 && R == 0
  puts 'Yes'
elsif L == 0 && R == 1
  puts 'No'
else
  puts 'Invalid'
end



