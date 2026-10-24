#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"

# pq = AcLibraryRb::PriorityQueue.new

# require 'prime'
# pd = Prime.prime_division(a)

$debug = !ARGV[0].nil?

MOD = 998244353

N, M = STDIN.gets.chomp.split.map(&:to_i)
ABCS = (1..M).map do
  STDIN.gets.chomp.split.map(&:to_i)
end


paths = {}
ABCS.each do |a, b, c|
  paths[a] ||= []
  paths[a] << [b, c]
end

def calc(paths)

  pq = AcLibraryRb::PriorityQueue.new {|(a1, l1), (a2, l2)| l1 < l2 }

  pq << [1, 0]

  calced = {}

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
        pq << [b, l * 10 + c]
      end
    end
  end

  calced
end


rs = calc(paths)
(2..N).each do |a|
  puts rs[a] % MOD
end
