#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"


# require 'prime'
# pd = Prime.prime_division(a)

$debug = !ARGV[0].nil?

N, M = STDIN.gets.chomp.split.map(&:to_i)
LRS = (1..M).map do
  STDIN.gets.chomp.split.map(&:to_i)
end
Q = STDIN.gets.chomp.to_i
STS = (1..Q).map do
  STDIN.gets.chomp.split.map(&:to_i)
end

pp(LRS:) if $debug

sheets = {}
LRS.each.with_index do |(l, r), i|
  sheets[l] ||= {}
  sheets[l][r] ||= []
  sheets[l][r] << i
end
pp(sheets:) if $debug

lris = LRS.map.with_index { |(l, r), i| [l, r, i] }
pp(lris:) if $debug
lrijs_l = lris.sort_by { |l, r, i| [l, -r] }.map.with_index { |(l, r, i), j| [l, r, i, j]}
lrijs_r = lris.sort_by { |l, r, i| [-r, l] }.map.with_index { |(l, r, i), j| [l, r, i, j]}
pp(lrijs_l:) if $debug
pp(lrijs_r:) if $debug

lrijs_l2 = lrijs_l.sort_by { |l, r, i, j| i }
lrijs_r2 = lrijs_r.sort_by { |l, r, i, j| i }
pp(lrijs_l2:) if $debug
pp(lrijs_r2:) if $debug


# covers = {}
# ris = []
# # pq = AcLibraryRb::PriorityQueue.new {|(r1, i1), (r2, i2)| r1 < r2 }

# lrs.each.with_index do |(l, r), i|
#   # pq.pop


  
# end


def calc(s, t, sheets, lrijs_l2, lrijs_r2)
  if sheets[s] && sheets[s][t]
    if 1 < sheets[s][t].length
      return true # おなじものが２つある
    else # 一つしかない
      i = sheets[s][t]
      l1, r1, i1, j1 = lrijs_l2[i]
      l2, r2, i2, j2 = lrijs_r2[i]
    end
  end

  if sheets[s] && sheets[s][t] && 1 < sheets[s][t].length
    return true # おなじものが２つある
  end



end

STS.each do |s, t|
  ans = calc(s, t, sheets, lrijs_l2, lrijs_r2)
  puts ans ? 'Yes' : 'No'
end


