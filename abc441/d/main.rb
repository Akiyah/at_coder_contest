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

N, M, L, S, T = STDIN.gets.chomp.split.map(&:to_i)
UVCS = (1..M).map do
  STDIN.gets.chomp.split.map(&:to_i)
end


paths = {}
UVCS.each do |u, v, c|
  paths[u] ||= {}
  paths[u][v] ||= []
  paths[u][v] << c
end


def calc(paths)
  dp = [[1, 0]] # [u, c]


  L.times do
    dp_new = []
    dp.each do |u, c|
      next unless paths[u]
      paths[u].each do |v, cs|
        cs.each do |c2|
          dp_new << [v, c + c2] if c + c2 <= T
        end
      end
    end
    dp = dp_new
  end

  pp(dp:) if $debug

  rs = []
  dp.each do |u, c|
    rs << u if S <= c
  end

  rs.uniq.sort
end



puts calc(paths).join(' ')


