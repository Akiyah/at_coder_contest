#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
require "ac-library-rb/scc"

# pq = AcLibraryRb::PriorityQueue.new

# require 'prime'
# pd = Prime.prime_division(a)

$debug = !ARGV[0].nil?

N, Q = STDIN.gets.chomp.split.map(&:to_i)
TUVS = (1..Q).map do
  STDIN.gets.chomp.split.map(&:to_i)
end


def calc

  graph = AcLibraryRb::SCC.new(N)
  paths1 = Array.new(N) { [] }
  TUVS.each do |t, u1, v1|
    u = u1 - 1
    v = v1 - 1
    graph.add_edge(u, v)
    if t == 1
      paths1[u] << v
    end
  end

  # pp(graph.scc)

  ans = []
  graph.scc.each.with_index do |us, i|
    us.each do |u|
      ans[u] = i + 1
    end
  end


  paths1.each.with_index do |vs, u|
    vs.each do |v|
      if ans[u] == ans[v]
        return false
      end
    end
  end

  ans
end

rs = calc()
if rs
  puts 'Yes'
  puts rs.join(' ')
else
  puts 'No'
end



if $debug && rs
  TUVS.each do |t, u, v|
    unless rs[u - 1] + t <= rs[v - 1]
      puts "#{t} #{u} #{v} : NG"
    else
      puts "#{t} #{u} #{v} : OK"
    end
  end
end


# > 2 1 1 1 1 1 1 2 2 1 1 3 1 2 2
# > 1 0 0 0 0 0 0 1 1 0 0 2 0 1 1
