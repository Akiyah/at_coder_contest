#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"

$debug = !ARGV[0].nil?

# N = STDIN.gets.chomp.to_i
# N, A, X, Y = STDIN.gets.chomp.split.map(&:to_i)
# AS = (1..N).map do
#   STDIN.gets.chomp.to_i
#   STDIN.gets.chomp.split.map(&:to_i)
# end

N, K = STDIN.gets.chomp.split.map(&:to_i)
PS = STDIN.gets.chomp.split.map(&:to_i)


def calc
  rs = PS
  rss = []
  k = 0
  while k < K
    pp k if $debug
    pp rs.join(' ') if $debug
    rs = rs.map { |r| rs[r - 1] }

    k2 = rss.find_index(rs)
    if k2
      d = k - k2
      k3 = k2 + ((K - 1 - k2) % d)
      pp [k, K, k2, k3, rss.count] if $debug
      return rss[k3]
    end

    k += 1
    rss << rs
  end

  rs
end

rs = calc()

puts rs.join(' ')
