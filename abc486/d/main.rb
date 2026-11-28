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
  ln, pn = LPS[-1]

  dp = { 1 => 0 } # l => p

  LPS[...-1].each.with_index do |(l, p), i|
    dp_new = {}
    dp.each do |l0, p0|
      next if l0 < ln - (N - 1 - i)
      dp_new[l0] = p0 if !dp_new[l0] || p0 < dp_new[l0]
      if l <= l0
        dp_new[l0 + 1] = p0 + p if !dp_new[l0 + 1] || p0 + p < dp_new[l0 + 1]
      end
    end

    dp = dp_new
    pp(dp:) if $debug
  end

  ps = []
  dp.each do |l0, p0|
    if ln <= l0
      ps << p0 + pn
    end
  end

  if 0 < ps.length
    ps.min
  else
    -1
  end
end




puts calc

