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
# N, A, X, Y = STDIN.gets.chomp.split.map(&:to_i)
# AS = (1..N).map do
#   STDIN.gets.chomp.to_i
#   STDIN.gets.chomp.split.map(&:to_i)
# end




def calc(n, rs)
  pp(n:, rs:) if $debug
  r_min = rs.min

  dps = {}
  # used_is = []
  rs.map.with_index do |r, i|
    dps[r] ||= []
    dps[r] << i
  end
  pp(dps:) if $debug

  r = r_min
  ans = 0
  dp = dps[r_min]
  while 0 < dp.length
    dp_new = []
    dp.each do |i|
      if i + 1 < n # && !used_is[i + 1]
        if rs[i] + 1 < rs[i + 1]
          d = rs[i + 1] - (rs[i] + 1)
          ans += d
          rs[i + 1] = rs[i] + 1
          dp_new << i + 1
        end
        # used_is[i + 1] = true
      end
      if 0 <= i - 1 # && !used_is[i - 1]
        if rs[i] + 1 < rs[i - 1]
          d = rs[i - 1] - (rs[i] + 1)
          ans += d
          rs[i - 1] = rs[i] + 1
          dp_new << i - 1
        end
        # used_is[i - 1] = true
      end
    end
    r = r + 1
    dp = dp_new + (dps[r] || [])
  end

  ans
end


T.times do
  n = STDIN.gets.chomp.to_i
  rs = STDIN.gets.chomp.split.map(&:to_i)
  puts calc(n, rs)
end

