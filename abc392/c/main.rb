#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"

$debug = !ARGV[0].nil?

N = STDIN.gets.chomp.to_i
PS = STDIN.gets.chomp.split.map(&:to_i)
QS = STDIN.gets.chomp.split.map(&:to_i)
# AS = (1..N).map do
#   STDIN.gets.chomp.to_i
#   STDIN.gets.chomp.split.map(&:to_i)
# end


ps = []
PS.each_with_index do |p, i|
  ps[p - 1] = i + 1
end
qs = []
QS.each_with_index do |q, i|
  qs[q - 1] = i + 1
end

pp PS if $debug 
pp ps if $debug 
pp QS if $debug 
pp qs if $debug 
pp "-" if $debug

rs = []
(1..N).each do |i|
  q = qs[i - 1]
  p = PS[q - 1]
  r = QS[p - 1]
  pp [i, q, p, r] if $debug 
  pp [QS, p, QS[p - 1]] if $debug 
  rs[i - 1] = r
end

puts rs.join(' ')
