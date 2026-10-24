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

N, M, S, T = STDIN.gets.chomp.split.map(&:to_i)
ABS = (1..M).map do
  STDIN.gets.chomp.split.map(&:to_i)
end

paths = {}
ABS.sort_by { |a, b| b }.each do |a, b|
  if !paths[a]
    paths[a] = []
    paths[a] << [b, 0]
  else
    paths[a] << [b, 1]
  end
end

pp(paths:) if $debug


def calc(paths)

  pq = AcLibraryRb::PriorityQueue.new {|(a1, l1), (a2, l2)| l1 < l2 }
  pq << [S, 0]
  calced = {}

  cost = 0
  while !pq.empty?
    a, l = pq.pop
    pp(a:, l:) if $debug

    next if calced[a]
    calced[a] = l

    bcs = paths[a]
    next unless bcs

    bcs.each do |b, c|
      pp(b:, c:) if $debug
      unless calced[b]
        pq << [b, l + c]
        return l + c if b == T
      end
    end
  end

  -1
end



r = calc(paths)
puts r
