N, M = gets.chomp.split.map(&:to_i)

AS = gets.chomp.split.map(&:to_i)

GRAPH = {}
(1..M).each do
  u, v = gets.chomp.split.map(&:to_i)
  GRAPH[u] ||= []
  GRAPH[u] << v
  GRAPH[v] ||= []
  GRAPH[v] << u
end

# pp AS
# pp GRAPH

def calc_max(path)
  i = path[-1]

  if i == N
    return path.map {|v| AS[v - 1]}.uniq.size
  end

  vs = GRAPH[i] - path
  vs = vs.select do |v|
    AS[v - 1] >= AS[i - 1]
  end
  return 0 if vs == []

  vs.map do |v| calc_max(path + [v]) end.max
end

puts calc_max([1])
