#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"

# require "set"

$debug = !ARGV[0].nil?

N = STDIN.gets.chomp.to_i
AS = STDIN.gets.chomp.split.map(&:to_i)


def calc1(as, bs, rs)
  n = as.length

  if n == 0
    rs << bs.inject(:^)
    return
  end

  m = bs.length
  # bs2 = bs.dup
  bs2 = bs
  (0...m).each do |j|
    bs2[j] += as[0]
    calc1(as[1..], bs2, rs)
    bs2[j] -= as[0]
  end
  calc1(as[1..], bs + [as[0]], rs)
end

def calc(as)
  rs = Set.new
  calc1(as, [], rs)
  pp rs.length if $debug
  rs.length
end

puts calc(AS)

