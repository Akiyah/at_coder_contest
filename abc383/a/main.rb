#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"

$debug = !ARGV[0].nil?

# N = STDIN.gets.chomp.to_i
# N, A, X, Y = STDIN.gets.chomp.split.map(&:to_i)
# AS = (1..N).map do
#   STDIN.gets.chomp.to_i
#   STDIN.gets.chomp.split.map(&:to_i)
# end


N = STDIN.gets.chomp.to_i
TVS = (1..N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end

r = 0
t_last = 0
TVS.each do |t, v|
  r = [r - (t - t_last), 0].max
  r += v
  t_last = t
  puts r if $debug
end

puts r


