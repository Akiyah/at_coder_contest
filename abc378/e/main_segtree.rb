#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s


# require "ac-library-rb/priority_queue"
require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"

$debug = !ARGV[0].nil?

# N = STDIN.gets.chomp.to_i
# N, A, X, Y = STDIN.gets.chomp.split.map(&:to_i)
# AS = (1..N).map do
#   STDIN.gets.chomp.to_i
#   STDIN.gets.chomp.split.map(&:to_i)
# end

N, M = STDIN.gets.chomp.split.map(&:to_i)
AS = STDIN.gets.chomp.split.map(&:to_i)

seg = AcLibraryRb::Segtree.new(N, 0) { |x, y| (x + y) % M }

AS.each_with_index do |a, i|
  seg.set(i, a % M)
end


def calc(seg)
  s = 0
  (0...N).each do |l|
    puts l
    (l...N).each do |r|
      s += seg.prod(l, r + 1)
    end
  end
  s
end

puts calc(seg)
