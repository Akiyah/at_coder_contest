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

AS = STDIN.gets.chomp.split.map(&:to_i)


r = AS.group_by(&:itself).map do |k, v|
  if 4 <= v.count
    2
  elsif 2 <= v.count
    1
  else
    0
  end
end.sum

puts r

