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


N = STDIN.gets.chomp.to_i
AS = STDIN.gets.chomp.split.map(&:to_i)


def calc(as)
  ds = Array.new(N, 0)
  d = 0
  rs = []
  (0...N).each do |i|
    d += ds[i]
    r = as[i] + d
    if i < N - 1
      if N - 1 - i <= r
        ds[i + 1] += 1
        r -= N - 1 - i
      else
        pp r if $debug
        ds[i + 1] += 1
        ds[i + 1 + r] += -1
        r = 0
      end
    end

    pp [i, ds, r] if $debug
    rs << r
  end
  rs
end


puts calc(AS).join(' ')


