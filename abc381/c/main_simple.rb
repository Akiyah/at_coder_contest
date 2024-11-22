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
S = STDIN.gets.chomp


def calc
  n = N / 2
  (0..n).to_a.reverse.each do |i|
    s = ('1' * i) + '/' + ('2' * i)
    pp [s, S] if $debug
    return (i * 2 + 1) if S.include?(s)
  end

  0
end


puts calc
