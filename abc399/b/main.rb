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
PS = STDIN.gets.chomp.split.map(&:to_i)
# AS = (1..N).map do
#   STDIN.gets.chomp.to_i
#   STDIN.gets.chomp.split.map(&:to_i)
# end

def calc
  r = 1
  c = 0
  rs = []
  prs = PS.map { |p| [p, nil] }
  while c < N
    c0 = 0
    p_max = prs.select { |p, r| r == nil }.map { |p, r| p }.max
    pp p_max if $debug
    N.times do |i|
      if prs[i][0] == p_max
        prs[i][1] = r
        c0 += 1
      end
    end

    pp prs if $debug

    r += c0
    c += c0
  end

  prs
end

prs = calc

pp prs if $debug

prs.each do |p, r|
  puts r
end

