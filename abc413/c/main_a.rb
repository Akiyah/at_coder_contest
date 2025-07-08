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

Q = STDIN.gets.chomp.to_i
# N, A, X, Y = STDIN.gets.chomp.split.map(&:to_i)
# AS = (1..N).map do
#   STDIN.gets.chomp.to_i
#   STDIN.gets.chomp.split.map(&:to_i)
# end


def calc_one(k)
  i = 0
  y = 0
  while $as[i][1] < k
    x, c = $as[i]
    k -= c
    y += x * c
    i += 1
  end

  $as = $as[i..]
  x, c = $as[0]
  y += x * k
  $as[0] = [x, c - k]
  y
end

$as = []
(1..Q).each do
  t, a1, a2 = STDIN.gets.chomp.split.map(&:to_i)
  if t == 1
    c, x = a1, a2
    $as << [x, c]
  else # t == 2
    k = a1
    y = calc_one(k)
    puts y
  end
end


