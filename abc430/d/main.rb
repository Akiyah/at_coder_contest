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

N = STDIN.gets.chomp.to_i
XS = STDIN.gets.chomp.split.map(&:to_i)

INF = 10 ** 10

sum = 0
hs = []
hs << [0, INF, INF] # x, l, r
XS.each do |x|

  if hs.length == 1
      h0 = [0, INF, x]
      hx = [x, x, INF]
      hs = [h0, hx]
      sum = x * 2
  else
    i = hs.bsearch_index { |h| x < h[0] }
    pp(x:, i:) if $debug

    if i
      h0 = hs[i - 1]
      h1 = hs[i]
      sum -= [h0[1], h0[2]].min
      sum -= [h1[1], h1[2]].min

      h0[2] = x - h0[0]
      h1[1] = h1[0] - x
      hx = [x, x - h0[0], h1[0] - x]
      sum += [h0[1], h0[2]].min
      sum += [hx[1], hx[2]].min
      sum += [h1[1], h1[2]].min

      hs = hs[0...i] + [hx] + hs[i..]
    else # 最後
      h0 = hs[-1]
      sum -= [h0[1], h0[2]].min

      h0[2] = x - h0[0]
      hx = [x, x - h0[0], INF]
      sum += [hx[1], hx[2]].min
      sum += [h0[1], h0[2]].min

      hs = hs + [hx]
    end
  end

  puts sum
end




