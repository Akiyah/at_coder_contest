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


def calc
  n = STDIN.gets.chomp.to_i
  ss = STDIN.gets.chomp.split.map(&:to_i)

  pp(ss: ss.sort) if $debug

  s0 = ss[0]
  s_1 = ss[-1]
  ss2 = ss[1...-1].sort

  pp(s0:, s_1:, ss2:) if $debug

  r = 1
  s = s0
  while true
    pp(r:, s:, ss2:) if $debug
    return r + 1 if s_1 <= s * 2
    return -1 if ss2.length == 0

    j = ss2.find_index { |s2| s * 2 < s2 }
    pp(j:) if $debug
    if j == 0 # 倒せるコマがない
      return -1
    end
    if j == nil # どれでもたおせる
      if s_1 <= ss2[-1] * 2
        return r + 2
      else
        return -1
      end
    end

    r += 1
    s = ss2[j - 1]
    ss2 = ss2[j..]
  end
  
end


T.times do
  puts calc()
end
