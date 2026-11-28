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
LPS = (1..N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end


def calc

  dp = { 1 => 0 } # l => p

  LPS[...-1].each do |l, p|
    dp_new = {}
    dp.each do |l0, p0|
      if dp_new[l0]
        dp_new[l0] = [p0, dp_new[l0]].min
      else
        dp_new[l0] = p0
      end
      if l <= l0
        l1 = l0 + 1
        p1 = p0 + p
        if dp_new[l1]
          dp_new[l1] = [p1, dp_new[l1]].min
        else
          dp_new[l1] = p1
        end
      end
    end

    dp = dp_new
  end

  l, p = LPS[-1]
  ps = []
  dp.each do |l0, p0|
    if l <= l0
      ps << p0 + p
    end
  end

  if 0 < ps.length
    ps.min
  else
    -1
  end
end




puts calc

