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
UVS = (1..M).map do
  STDIN.gets.chomp.split.map(&:to_i)
end

def calc_one(i, paths)
  ds = {}
  ds[i] = true
  us = [i]
  r = 0
  pp(us:, ds:) if $debug
  while 0 < us.length
    u = us.shift
    pp(u:) if $debug
    paths[u].each do |v|
      if ds[v] != nil
        if ds[v] == ds[u]
          pp(name: 'del', u:, v:) if $debug
          r += 1 # 一本切断する
        end
      else
        ds[v] = !ds[u]
        us << v
      end
    end
    pp(us:, ds:) if $debug
  end

  r / 2
end


def calc
  paths = {}
  UVS.each do |u, v|
    paths[u] ||= []
    paths[u] << v
    paths[v] ||= []
    paths[v] << u
  end

  (1..N).map do |u|
    r = calc_one(u, paths)
    pp(name: 'calc', u:, r:) if $debug
    r
  end.min
end


puts calc




