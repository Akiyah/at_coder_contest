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

N, M = STDIN.gets.chomp.split.map(&:to_i)
AS = STDIN.gets.chomp.split.map(&:to_i)
as = AS.map { |a| a % M }

def calc(as)
  bs = []
  m_count = 0
  s = 0
  (0...N).each do |l|
    m_count += bs.count { |b| M <= b + as[l] }
    new_bs = (bs + [0]).map { |b| (b + as[l]) % M }
    pp new_bs if $debug
    s += new_bs.sum
    bs = new_bs
  end
  s
end

puts calc(as)
