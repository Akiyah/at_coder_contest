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

N, M = STDIN.gets.chomp.split.map(&:to_i)
BS = STDIN.gets.chomp.split.map(&:to_i)
WS = STDIN.gets.chomp.split.map(&:to_i)


def calc
  bs = BS.sort.reverse
  ws = WS.sort.reverse

  pp [bs, ws] if $debug

  i_max = bs.bsearch_index { |b| b < 0 }
  j_max = ws.bsearch_index { |w| w < 0 }

  pp [i_max, j_max] if $debug

  i_max ||= N

  s = if i_max == 0
    0
  else
    bs[0..(i_max - 1)].sum
  end

  pp s if $debug

  s_max = s
  nm = [N, M].min
  (0...nm).each do |j|
    if j < i_max
      s += ws[j]
      s_max = s if s_max < s
    else
      s += (ws[j] + bs[j])
      s_max = s if s_max < s
    end
  end

  s_max
end



puts calc
