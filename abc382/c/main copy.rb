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


N, M = STDIN.gets.chomp.split.map(&:to_i)
AS = STDIN.gets.chomp.split.map(&:to_i)
BS = STDIN.gets.chomp.split.map(&:to_i)

ais = []
a_last = nil
AS.zip(1..N).each do |a, i|
  if a_last == nil || a < a_last
    ais << [a, i]
    a_last = a
  end
end


BS.zip(1..N).sort

groups = AS.zip(1..N).group_by { |a, i| a }
groups.each do |k, v|
  v.sort!
end

pp groups if $debug

max_i = groups.keys.max


last_i = nil
positions = (0..max_i).to_a.map do |i|
  if groups[i]
    last_i = i
  end
  last_i
end

pp positions if $debug

rs = BS.map do |b|
  if max_i < b
    b = max_i
  end

  j = positions[b]
  if groups[j] && 0 < groups[j].length
    x = groups[j][0] # .shift
    pp [b, j, x] if $debug
    x[1]
  else
    pp [b, -1] if $debug
    -1
  end
end
pp rs if $debug

rs.each do |r|
  puts r
end
