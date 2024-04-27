#require "ac-library-rb/priority_queue"

$debug = !ARGV[0].nil?

# N, A, X, Y = STDIN.gets.chomp.split.map(&:to_i)
# N = STDIN.gets.chomp.to_i
# AS = (1..N).map do
#   STDIN.gets.chomp.split.map(&:to_i)
#   STDIN.gets.chomp.to_i
# end

# pq = AcLibraryRb::PriorityQueue.new

N = STDIN.gets.chomp.to_i
AS = STDIN.gets.chomp.split.map(&:to_i)

pp AS if $debug


def calc(as)
  rs = []
  as.each do |a|
    rs << a
    while 1 < rs.length && rs[-1] == rs[-2]
      rs.pop
      rs[-1] += 1
    end
  end
  rs
end

rs = calc(AS)

pp rs if $debug


puts rs.length
