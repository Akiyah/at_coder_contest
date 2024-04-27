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
AS = (1..N).map do
  STDIN.gets.chomp.split('')
end
BS = (1..N).map do
  STDIN.gets.chomp.split('')
end

pp AS if $debug
pp BS if $debug

(1..N).each do |i|
  (1..N).each do |j|
    pp [i, j, AS[i-1][j-1], BS[i-1][j-1], AS[i-1][j-1] != BS[i-1][j-1]] if $debug
    puts "#{i} #{j}" if AS[i-1][j-1] != BS[i-1][j-1]
  end
end
