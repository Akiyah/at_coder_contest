#require "ac-library-rb/priority_queue"

$debug = !ARGV[0].nil?

# N, A, X, Y = STDIN.gets.chomp.split.map(&:to_i)
# N = STDIN.gets.chomp.to_i
# AS = (1..N).map do
#   STDIN.gets.chomp.split.map(&:to_i)
#   STDIN.gets.chomp.to_i
# end

# pq = AcLibraryRb::PriorityQueue.new


AS = STDIN.gets.chomp.split.map(&:to_i)
BS = STDIN.gets.chomp.split.map(&:to_i)

puts AS.sum - BS.sum + 1