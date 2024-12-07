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


N, M, K = STDIN.gets.chomp.split.map(&:to_i)
UVWS = (1..M).map do
  STDIN.gets.chomp.split.map(&:to_i)
end
AS = STDIN.gets.chomp.split.map(&:to_i)
BS = STDIN.gets.chomp.split.map(&:to_i)


pp [N, M, K, UVWS, AS, BS] if $debug