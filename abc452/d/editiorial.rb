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
T = STDIN.gets.chomp


def calc()
  ss = S.chars
  ts = T.chars
  l_s = ss.length
  l_t = ts.length

  dp = Array.new(l_t + 1, 0)

  r = 0
  ss.each.with_index do |s, i|
    dp_new = Array.new(l_t + 1, 0)

    (0..l_t).each do |j|
      d = 0
      if j == 0
        if s != ts[0] # j
          d += 1
        else
        end
      end

      if j == 1
        if s != ts[0] # j - 1
        else
          d += 1
        end
      end

      if (j < l_t && s != ts[j]) || j == l_t
        d += dp[j]
      end

      if 0 < j && s == ts[j - 1]
        d += dp[j - 1]
      end

      dp_new[j] = d
    end

    dp = dp_new
    pp(dp:) if $debug
    r += dp[-1]
  end

  l_s * (l_s + 1) / 2 - r
end

puts calc()


