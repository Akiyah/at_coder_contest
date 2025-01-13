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
  n = as.length
  return 0 if n <= 1

  rs = []
  (0...n).to_a.combination(2) do |i, j|
    if as[i] * 2 <= as[j]
      as2 = as[0...i] + as[(i + 1)...j] + as[(j + 1)..]
      rs << 1 + calc(as2)
    end
  end

  return 0 if rs.length == 0

  rs.max
end

puts calc(AS)
