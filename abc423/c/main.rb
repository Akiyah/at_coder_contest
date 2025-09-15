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

N, R = STDIN.gets.chomp.split.map(&:to_i)
LS = STDIN.gets.chomp.split.map(&:to_i)

pp(N:, R:, LS:) if $debug

def calc
    il = LS.index(0)
    ir = LS.rindex(0)
    pp(il:, ir:) if $debug

    if il == nil
      return 0
    end

    il = R if R < il
    ir = R - 1 if ir < R - 1

    ls = LS[il..ir]
    r = R - il

    pp(LS:, ls:, r:) if $debug

    ans = ls.count(1) + ls.length
    ans
end



puts calc
