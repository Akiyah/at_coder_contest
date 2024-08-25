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


T = STDIN.gets.chomp.to_i

def calc(n, k, as, bs)
   true
end




(1..T).each do |t|
  n, k = STDIN.gets.chomp.split.map(&:to_i)
  as = STDIN.gets.chomp.split.map(&:to_i)
  bs = STDIN.gets.chomp.split.map(&:to_i)

  puts calc(n, k, as, bs) ? 'Yes' : 'No'
end

