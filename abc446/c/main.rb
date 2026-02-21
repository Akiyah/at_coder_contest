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
# N, A, X, Y = STDIN.gets.chomp.split.map(&:to_i)
# AS = (1..N).map do
#   STDIN.gets.chomp.to_i
#   STDIN.gets.chomp.split.map(&:to_i)
# end


def calc(n, d, as, bs)
  es = []
  s = 0
  n.times do |i|
    pp('a', es:, s:) if $debug
    es << [i, as[i]]
    s += as[i]

    pp('b', es:, s:) if $debug

    b = bs[i]
    while true
      i1, a1 = es[0]
      if b < a1
        es[0][1] -= b
        s -= b
        break
      else
        es.shift
        b -= a1
        s -= a1
        break if b == 0
      end
    end

    pp('c', es:, s:) if $debug

    while 0 < es.length
      i1, a1 = es[0]
      pp(i:, i1:, a1:) if $debug
      if d <= i - i1
        es.shift
        s -= a1
      else
        break
      end
    end

    pp('d', es:, s:) if $debug
  end
  
  s
end


T.times do
  n, d = STDIN.gets.chomp.split.map(&:to_i)
  as = STDIN.gets.chomp.split.map(&:to_i)
  bs = STDIN.gets.chomp.split.map(&:to_i)
  puts calc(n, d, as, bs)

end


