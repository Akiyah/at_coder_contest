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

N, M = STDIN.gets.chomp.split(' ').map(&:to_i)
ABW = M.times.map do
  STDIN.gets.chomp.split(' ').map(&:to_i)
end

def calc
  paths = {}
  ABW.each do |a, b, w|
    pp(a:, b:, w:) if $debug
    paths[a] ||= {}
    paths[a][b] ||= []
    paths[a][b] << w
  end
  pp(paths:) if $debug


  xors = { 1 => { 0 => true } }
  dp = []
  dp << { xor: 0, a: 1 }
  pp(dp:, xors:) if $debug

  while 0 < dp.length
    h = dp.shift
    pp(h:) if $debug
    xor = h[:xor]
    a = h[:a]

    next unless paths[a]

    paths[a].each do |b, ws|
      ws.each do |w|
        xor2 = xor ^ w
        next if xors[b] && xors[b][xor2]
        
        xors[b] ||= {}
        xors[b][xor2] = true

        dp << { xor: xor2, a: b }
      end
    end

    pp(dp:, xors:) if $debug
  end

  xors[N] ? xors[N].keys.min : -1
end

puts calc

