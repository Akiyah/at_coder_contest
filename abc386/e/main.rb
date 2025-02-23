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

N, K = STDIN.gets.chomp.split.map(&:to_i)
AS = STDIN.gets.chomp.split.map(&:to_i)


if K == N
  puts AS.inject(:^)
  exit
end

if K < N - K
  r = AS.combination(K).map { |as|
    as.inject(:^)
  }.max

  puts r
else
  s = AS.inject(:^)

  r = AS.combination(N - K).map { |as|
    s ^ as.inject(:^)
  }.max

  puts r
end
