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


N = STDIN.gets.chomp.to_i
MG = STDIN.gets.chomp.to_i
UVS = (1..MG).map do
  STDIN.gets.chomp.split.map(&:to_i)
end


MH = STDIN.gets.chomp.to_i
ABS = (1..MH).map do
  STDIN.gets.chomp.split.map(&:to_i)
end

AS = (1...N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end

pp [N, MG, UVS, MH, ABS, AS] if $debug

def calc_cost(vs, path_g, path_h, cost_map)
  cost = 0
  (0...N).each do |i|
    (0...i).each do |j| # j < i
      # pp [i, j] if $debug
      # pp cost_map[i][j] if $debug
      if path_g[vs[i]][vs[j]] != path_h[i][j]
        pp [i, j, path_g[vs[i]][vs[j]], path_h[i][j]] if $debug
        cost += cost_map[i][j]
      end
    end      
  end
  cost
end


def calc
  if N == 0
    return 0
  end


  path_g = Array.new(N) { Array.new(N, false) }
  UVS.each do |u, v|
    path_g[u - 1][v - 1] = true
    path_g[v - 1][u - 1] = true
  end

  path_h = Array.new(N) { Array.new(N, false) }
  ABS.each do |u, v|
    path_h[u - 1][v - 1] = true
    path_h[v - 1][u - 1] = true
  end

  cost_map = Array.new(N) { Array.new(N, 0) }
  AS.each.with_index do |as, i|
    as.each.with_index do |a, j2|
      j = j2 + i + 1
      cost_map[i][j] = a
      cost_map[j][i] = a
    end    
  end

  pp [path_g, path_h, cost_map] if $debug

  rs = (0...N).to_a.permutation.map do |vs|
    r = calc_cost(vs, path_g, path_h, cost_map)
    pp [vs, r] if $debug
    r
  end
  # pp rs if $debug
  rs.min
end


puts calc
