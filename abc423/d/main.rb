#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"

# pq = AcLibraryRb::PriorityQueue.new

# require 'prime'
# pd = Prime.prime_division(a)

$debug = !ARGV[0].nil?

N, K = STDIN.gets.chomp.split.map(&:to_i)
ABCS = (1..N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end


def calc_next(k, abc, cb2)
  a, b, c = abc
  c2, b2 = cb2 # 人数、退店時刻
  # pp(a:, b:, c:, c2:, b2:) if $debug

  if b2 == nil || (a < b2 && c <= k)
    return true # 入店
  else
    return false # 退店
  end
end

def calc
  pq = AcLibraryRb::PriorityQueue.new() {|cb1, cb2| cb1[1] < cb2[1] } # 人数、退店時刻

  k = K
  rs = []
  i = 0
  t = 0
  abc = ABCS[i]

  cb2 = nil

  while true
    pp(t:, k:, abc:, cb2:) if $debug

    x = calc_next(k, abc, cb2)

    if x # 入店
      pp('入店') if $debug
      t = [t, abc[0]].max
      rs << t
      pq.push([abc[2], t + abc[1]])
      cb2 = pq.get
      k -= abc[2]

      i += 1
      abc = ABCS[i]
      return rs unless abc
    else # 退店
      pp('退店') if $debug
      t = [t, cb2[1]].max
      k += cb2[0]
      pq.pop # 人数、退店時刻
      cb2 = pq.get # 人数、退店時刻
    end
  end
end



rs = calc
rs.each do |r|
  puts r
end


