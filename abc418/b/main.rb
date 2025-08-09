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

S = STDIN.gets.chomp

def calc(ss)
  l = ss.length
  js = []
  (0...l).each do |j|
    js << j if ss[j] == 't'
  end

  r = 0
  js.each_with_index do |j1, i1|
    js[(i1 + 1)...].each_with_index do |j2, i2|
      lj = j2 - j1
      li = (i1 + 1 + i2) - i1
      next if li == 1

      pp(ss, [j1, i1], [j2, i2]) if $debug
      r0 = (li - 1).to_f / (lj - 1).to_f
      r = r0 if r < r0
    end
  end

  r
end





puts calc(S.split(''))


