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

MOD = 998244353

N, M = STDIN.gets.chomp.split.map(&:to_i)
ABCS = (1..M).map do
  STDIN.gets.chomp.split.map(&:to_i)
end

paths = Array.new(10) { {} }
ABCS.each do |a, b, c|
  paths[c][a] ||= []
  paths[c][a] << b
end

def calc(paths)

  dp = []
  dp << [[1], 0]

  calced = {}

  while 0 < dp.length
    as, v = dp.shift
    pp(as:, v:) if $debug

    (1..9).each do |c|
      v2 = (v * 10 + c) % MOD
      bs = []
      as.each do |a|
        (paths[c][a] || []).each do |b|
          unless calced[b]
            bs << b
            calced[b] = v2
          end
        end
      end
      dp << [bs, v2] if 0 < bs.length
    end
  end

  calced
end


rs = calc(paths)
(2..N).each do |a|
  puts rs[a] % MOD
end
