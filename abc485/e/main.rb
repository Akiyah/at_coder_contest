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

N, M = STDIN.gets.chomp.split.map(&:to_i)
UVCS = (1..M).map do
  STDIN.gets.chomp.split.map(&:to_i)
end


def calc
  paths = {}
  UVCS.each do |u, v, c|
    paths[u] ||= {}
    paths[u][v] ||= []
    paths[u][v] << c
  end


  ls = {}
  ls[1] = 0

  pq = AcLibraryRb::PriorityQueue.new { |(u0, c0, l0), (u1, c1, l1)| l0 < l1 }
  pq << [1, nil, 0] # u, c, length
  while !pq.empty?
    u, c, l = pq.pop
    ls[u] = l

    (paths[u] || {}).each do |v, cs|
      cs.each do |c0|
        if c0 != c
          if v == N
            return l + 1
          end
          if !ls[v] || l + 1 < ls[v] 
            pq << [v, c0, l + 1]
          end
        end
      end
    end

  end


  -1
end




puts calc
