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
UVTS = (1..M).map do
  STDIN.gets.chomp.split.map(&:to_i)
end

paths = {}
UVTS.each do |u, v, t|
  paths[u] ||= {}
  paths[u][v] = paths[u][v] == nil ? t : [paths[u][v], t].miin

  paths[v] ||= {}
  paths[v][u] = paths[v][u] == nil ? t : [paths[v][u], t].miin
end







Q = STDIN.gets.chomp.to_i



(1..Q).each do
  k = STDIN.gets.chomp.to_i
  bs = STDIN.gets.chomp.split.map(&:to_i)



  puts 0
end




