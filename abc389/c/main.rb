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

Q = STDIN.gets.chomp.to_i
QUERIES = (1..Q).map do
  STDIN.gets.chomp.split
end

snakes = []
l = 0
j = 0

QUERIES.each do |t, i|
  pp [t, i, l, j, snakes] if $debug

  if t == '1'
    snakes << (snakes[-1] || 0) + i.to_i
    l += i.to_i
  elsif t == '2'
    j += 1
  else # t == '3'
    # pp snakes if $debug
    # pp l if $debug
    # pp snakes[i.to_i - 1] if $debug
    # pp snakes[i.to_i - 1] - l if $debug
    k = i.to_i
    if j == 0
      puts k == 1 ? 0 : snakes[k - 1 - 1]
    else
      puts snakes[(k + j) - 1 - 1] - snakes[j - 1]
    end
  end
end

