require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"

$debug = !ARGV[0].nil?

# N = STDIN.gets.chomp.to_i
# N, A, X, Y = STDIN.gets.chomp.split.map(&:to_i)
# AS = (1..N).map do
#   STDIN.gets.chomp.to_i
#   STDIN.gets.chomp.split.map(&:to_i)
# end

N, M = STDIN.gets.chomp.split.map(&:to_i)
AS = STDIN.gets.chomp.split.map(&:to_i)
UVBS = (1..M).map do
  STDIN.gets.chomp.split.map(&:to_i)
end

path = {}
UVBS.each do |u, v, b|
  path[u] ||= []
  path[u] << [v, b]

  path[v] ||= []
  path[v] << [u, b]
end


pp [N, M, AS, UVBS] if $debug
pp path if $debug

def calc(path)
  calced = []
  calced_count = 0
  calcing = AcLibraryRb::PriorityQueue.new {|x, y| x[1] < y[1] } # node, value
  calcing.push([1, AS[1 - 1]])

  while !calcing.empty? && calced_count < N
    node, value = calcing.pop
    next if calced[node - 1]

    if path[node]
      path[node].each do |v, b|
        next if calced[v - 1]

        calcing.push([v, value + b + AS[v - 1]])
      end
    end

    calced[node - 1] = value
    calced_count += 1
    pp [calced, calced_count] if $debug
  end

  calced[1..-1]
end


rs = calc(path)
puts rs.join(' ')
