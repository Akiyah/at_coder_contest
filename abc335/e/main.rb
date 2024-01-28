n, m = gets.chomp.split.map(&:to_i)

as = [nil] + gets.chomp.split.map(&:to_i)
# pp as

graph = (1..m).map do
  gets.chomp.split.map(&:to_i)
end
# pp graph

uf = Hash.new { |h, k| h[k] = [k] }
graph.filter { |u, v| as[u] == as[v] }.each do |u, v|
  array = (uf[u] + uf[v]).uniq
  array.each do |i|
    uf[i] = array
  end
end
# pp uf

graph_up = {}
graph.filter { |u, v| as[u] != as[v] }.each do |u, v|
  u, v = v, u if as[u] > as[v]

  graph_up[as[u]] ||= {}
  graph_up[as[u]][u] ||= []
  graph_up[as[u]][u] << v
end
# pp graph_up

scores = Hash.new(0)
scores[uf[1]] = 1
graph_up.keys.sort.each do |k|
  graph_up[k].each do |u, vs|
    vs.each do |v|
      # pp [u, v]
      # pp [uf[u], uf[v]]
      if 0 < scores[uf[u]]
        scores[uf[v]] = [scores[uf[v]], scores[uf[u]] + 1].max
      end
    end
  end
end
# pp scores

puts scores[uf[n]]
