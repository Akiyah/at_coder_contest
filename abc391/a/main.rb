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


D = STDIN.gets.chomp


if D.length == 1
  puts ({'N' => 'S', 'S' => 'N', 'W' => 'E', 'E' => 'W'}[D])
else
  puts ({'NE' => 'SW', 'NW' => 'SE', 'SE' => 'NW', 'SW' => 'NE'}[D])
end
