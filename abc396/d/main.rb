#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"

# pq = AcLibraryRb::PriorityQueue.new

# require 'prime'
# pd = Prime.prime_division(a)

$debug = !ARGV[0].nil?

N, M = STDIN.gets.chomp.split.map(&:to_i)
UVWS = (1..M).map do
  STDIN.gets.chomp.split.map(&:to_i)
end


def calc

  paths = {}
  UVWS.each do |u, v, w|
    paths[u] ||= {}
    paths[u][v] = w
    paths[v] ||= {}
    paths[v][u] = w
  end

  pp paths if $debug

  values = [[1, 0, 1]] # u, w, nodeのbit
  pp values if $debug
  r = nil
  while 0 < values.length
    value = values.shift
    u, w, b = value
    paths[u].each do |v, w2|
      w3 = w ^ w2
      if v == N
        if r == nil
          r = w3
        else
          r = w3 if w3 < r
        end
      else
        if b[v - 1] == 0
          values << [v, w3, b + (1 << (v - 1))]
          pp values if $debug
        end
      end
    end
    pp values.length if $debug
  end

  r
end



puts calc
