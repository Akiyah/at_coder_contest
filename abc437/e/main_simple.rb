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

N = STDIN.gets.chomp.to_i
XYS = (1..N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end




def calc
  ass = []
  ass[0] = []
  XYS.each.with_index do |(x, y), i|
    ass[i + 1] = ass[x] + [y]
  end
  pp(ass:) if $debug


  assj = ass.map.with_index { |as, i| [as, i] }.sort_by { |as, i| as }
  pp(assj:) if $debug
  ps = assj[1..].map { |as, i| i }
  pp(ps:) if $debug
  ps
end


ps = calc
puts ps.join(' ')

