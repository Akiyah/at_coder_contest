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

N, Q = STDIN.gets.chomp.split.map(&:to_i)
PS = STDIN.gets.chomp.split.map(&:to_i)


ps = PS.dup
Q.times do |q|
  t, x, y = STDIN.gets.chomp.split.map(&:to_i)
  if t == 1
    ps[x - 1], ps[y - 1] = ps[y - 1], ps[x - 1]
  else
    new_ps = []
    ps.each.with_index do |p, i|
      new_ps[p - 1] = i + 1
    end
    ps = new_ps
  end
end

puts ps.join(' ')
