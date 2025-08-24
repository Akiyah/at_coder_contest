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

N, Q = STDIN.gets.chomp.split.map(&:to_i)
AS = STDIN.gets.chomp.split.map(&:to_i)
BS = STDIN.gets.chomp.split.map(&:to_i)
CXVS = (1..Q).map do
  c, x, v = STDIN.gets.chomp.split
  [c, x.to_i, v.to_i]
end


as = AS.dup
bs = BS.dup
CXVS.each do |c, x, v|
  if c == 'A'
    as[x - 1] = v
  else
    bs[x - 1] = v
  end

  r = N.times.map { |i| [as[i], bs[i]].min }.sum
  puts r

end
