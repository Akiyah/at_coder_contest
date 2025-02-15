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

S = STDIN.gets.chomp
r = 0
(0...(S.length)).each do |i|
  (0...(S.length)).each do |d|
    r += 1 if S[i] == 'A' && S[i + d] == 'B' && S[i + d + d] == 'C' 
  end
end

puts r


