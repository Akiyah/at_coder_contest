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


ps = PS.map { |p1| p1 - 1 }
qs = []
ps.each.with_index do |p, i|
  qs[p] = i
end
ts = []
b = true
Q.times do |q|
  t, x1, y1 = STDIN.gets.chomp.split.map(&:to_i)
  if t == 1
    x = x1 - 1
    y = y1 - 1
    if b
      px = ps[x]
      py = ps[y]
      ps[x], ps[y] = py, px
      qs[px], qs[py] = qs[py], qs[px]
    else
      qx = qs[x]
      qy = qs[y]
      qs[x], qs[y] = qy, qx
      ps[qx], ps[qy] = ps[qy], ps[qx]
    end
  else
    b = !b
  end
end

if b
  puts ps.map { |x| x + 1 }.join(' ')
else
  puts qs.map { |x| x + 1 }.join(' ')
end
