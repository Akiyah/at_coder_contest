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
PS = STDIN.gets.chomp.split.map(&:to_i)
LRS = (1..M).map do
  STDIN.gets.chomp.split.map(&:to_i)
end


def calc(ps)
  pis = ps.map.with_index { |p, i| [p, i] }
  pp(pis:) if $debug
  
  LRS.each do |l1, r1|
    l = l1 - 1
    r = r1 - 1
    p_max, i_max = pis[l..r].max { |(p0, i0), (p1, i1)| p0 <=> p1 }
    p_min, i_min = pis[l..r].min { |(p0, i0), (p1, i1)| p0 <=> p1 }

    pis[i_max][0], pis[i_min][0] = pis[i_min][0], pis[i_max][0]

    pp(pis:) if $debug
  end

  pis.map { |p, i| p }
end


ps = PS.dup
ps = calc(ps)

puts ps.join(' ')