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


def calc_one(k, as, as_index)
  y = 0
  while as[as_index][1] < k
    x, c = as[as_index]
    k -= c
    y += x * c
    as_index += 1
  end

  x, c = as[as_index]
  y += x * k
  as[as_index] = [x, c - k]
  [y, as_index]
end

as = []
as_index = 0
(1..Q).each do
  t, a1, a2 = STDIN.gets.chomp.split.map(&:to_i)
  if t == 1
    c, x = a1, a2
    as << [x, c]
  else # t == 2
    k = a1
    y, as_index = calc_one(k, as, as_index)
    puts y
  end
end


