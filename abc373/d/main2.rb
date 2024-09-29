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

N, M = STDIN.gets.chomp.split.map(&:to_i)
UVWS = (1..M).map do
  STDIN.gets.chomp.split.map(&:to_i)
end


edges = {}
# dsu = AcLibraryRb::DSU.new(N)

UVWS.each do |u, v, w|
  edges[u - 1] ||= []
  edges[u - 1] << [v - 1, w]
  edges[v - 1] ||= []
  edges[v - 1] << [u - 1, -w]

  # dsu.merge(u - 1, v - 1)
end

pp edges if $debug
# pp dsu if $debug

rs = Array.new(N)

(0...N).each do |u|
  next unless rs[u] == nil

  rs[u] = 0

  us = [u]
  us_next = []

  while 0 < us.length
    us.each do |u|
      if edges[u]
        edges[u].each do |v, w|
          if rs[v] == nil
            rs[v] = rs[u] + w
            us_next << v
          end
        end
      end
    end
    us = us_next
    us_next = []
  end
end

if $debug  
  pp rs

  UVWS.each do |u, v, w|
    pp [u, v, w, rs[u - 1], rs[v - 1], rs[v - 1] - rs[u - 1]]
    pp 'NO' unless rs[v - 1] - rs[u - 1] == w
  end
end



puts rs.join(' ')
