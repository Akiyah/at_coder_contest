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

N, C = STDIN.gets.chomp.split.map(&:to_i)
TS = STDIN.gets.chomp.split.map(&:to_i)

last_t = nil
co = 0
TS.each do |t|
  if last_t == nil || last_t + C <= t
    co += 1
    last_t = t
  end
end

puts co
