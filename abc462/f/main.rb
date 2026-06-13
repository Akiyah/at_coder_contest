#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"

# pq = AcLibraryRb::PriorityQueue.new

# require 'prime'
# pd = Prime.prime_division(a)

$debug = !ARGV[0].nil?

T = STDIN.gets.chomp.to_i


def calc(s, k)

  n = s.length
  cs = s.chars
  abc1s = []
  abc2s = []
  abc3s = []
  (n - 2).times do |i|
    x = 0
    x += 1 if cs[i] == 'A'
    x += 1 if cs[i + 1] == 'B'
    x += 1 if cs[i + 2] == 'C'
    if x == 3
      abc3s << i
    elsif x == 2
      abc2s << i
    elsif x == 1
      abc1s << i
    end
  end

  return -1 if s.length < (abc_count + k) * 3

  return 0 if s.length < (abc_count + k) * 3

  


  0
end


T.times do |t|
  pp(t:) if $debug

  s = STDIN.gets.chomp
  k = STDIN.gets.chomp.to_i
  puts calc(s, k)
end

