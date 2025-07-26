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



def calc_one(n, m, as, bs)
  as = as.sort
  bs = bs.sort.reverse

  ia = 0
  ib = 0
  c = 0
  while ia < n && ib < n
    pp(ia:, ib:) if $debug
    if m <= bs[ib] + as[ia]
      ib += 1
      ia += 1
      c += 1
    else
      ia += 1
    end
  end

  pp(as:, bs:, c:, n:, m:) if $debug
  as.sum + bs.sum - (c * m)
end


def calc()
  T.times do
    n, m = STDIN.gets.chomp.split.map(&:to_i)
    as = STDIN.gets.chomp.split.map(&:to_i)
    bs = STDIN.gets.chomp.split.map(&:to_i)

    puts calc_one(n, m, as, bs)
  end
end



calc

