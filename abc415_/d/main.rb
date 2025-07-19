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
ABS = (1..M).map do
  STDIN.gets.chomp.split.map(&:to_i)
end



def calc
  abds = ABS.map do |a, b|
    [a, b, a - b]
  end.sort_by { |a, b, d| d}
  pp(N:, M:, ABS:, abds:) if $debug

  i = 0
  r = 0
  bins = N

  while true
    a, b, d = abds[i]
    pp(i:, a:, b:, d:) if $debug
    if bins < a
      i += 1
      return r if i == M
      next
    end

    # ここでできる限り減らしてしまう。
    r0 = 1 + (bins - a) / d
    bins -= d * r0
    r += r0

  end

end


puts calc


