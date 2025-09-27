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
AS = STDIN.gets.chomp.split.map(&:to_i)

s = 0
ss = N.times.map { |i| s = s + AS[i] }
pp(ss:) if $debug

i = 0
Q.times do
  query = STDIN.gets.chomp.split.map(&:to_i)
  if query[0] == 1
    t, c = query
    i += c
  else # query[0] == 2
    t, l, r = query
    pp(t:, l:, r:) if $debug
    # c + l ... c + r
    l2 = (l - 1 + i) % N
    r2 = (r - 1 + i) % N
    pp(l2:, r2:) if $debug
    if l2 <= r2
      #s = AS[l2..r2].sum
      if l2 == 0
        s = ss[r2]
      else
        s = ss[r2] - ss[l2 - 1]
      end
    else
      # s = AS[l2..].sum + AS[..r2].sum
      if l2 == 0
        s = ss[r2] + ss[-1]
      else
        s = ss[r2] + ss[-1] - ss[l2 - 1]
      end
    end
    puts s
  end
end



