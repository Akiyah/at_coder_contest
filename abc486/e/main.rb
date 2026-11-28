#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"


# require 'prime'
# pd = Prime.prime_division(a)

$debug = !ARGV[0].nil?

T = STDIN.gets.chomp.to_i

def calc(n, m, uvcs)
  max_tc = 0

  edge_2_nodes = {}
  pq_array = []
  cs = []

  uvcs.each.with_index do |(u, v, c), i|
    edge_2_nodes[u] ||= []
    edge_2_nodes[u] << [u, v, c]
    edge_2_nodes[v] ||= []
    edge_2_nodes[v] << [u, v, c]
    pq_array << [u, v, c, c]
    pq_array << [v, u, c, c]

    cs << c
  end

  max_tc = cs.max


  pq = AcLibraryRb::PriorityQueue.new(pq_array) {|(u1, v1, c1, tc1), (u2, v2, c2, tc2)| c1 == c2 ? tc1 > tc2 : c1 < c2 }


  # nodes.sort_by! { |i, u, v, c| c }

  pp(edge_2_nodes:) if $debug

  used_edges = {}

  while !pq.empty?
    u, v, c, tc = pq.pop
    pp(u:, v:, c:, tc:) if $debug
    next if used_edges.dig(u, v)
    used_edges[u] ||= {}
    used_edges[u][v] = true
    pp('next') if $debug

    edge_2_nodes[v].each do |u2, v2, c2|
      next unless c < c2

      v3 = (u2 == v ? v2 : u2)
      next if used_edges.dig(v, v3)

      pq << [v, v3, c2, tc + c2]
      pp(type: 'push', u: u2, v: v2, c: c2, tc: tc + c2) if $debug

      max_tc = [tc + c2, max_tc].max
    end
  end

  max_tc
end


T.times do |t|
  n, m = STDIN.gets.chomp.split.map(&:to_i)
  uvcs = (1..m).map do
    STDIN.gets.chomp.split.map(&:to_i)
  end
  puts calc(n, m, uvcs)
end





