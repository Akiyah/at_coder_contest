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
AS = STDIN.gets.chomp.split.map(&:to_i)


if AS[0] < AS[1]
  as3 = [AS[1], AS[0], 0]
else
  as3 = [AS[0], AS[1], 0]
end

rs = []
(2...N).each do |k|
  a = AS[k]
  if as3[2] < a
    if as3[1] < a
      if as3[0] < a
        as3 = [a, as3[0], as3[1]]
      else
        as3 = [as3[0], a, as3[1]]
      end
    else
      as3 = [as3[0], as3[1], a]
    end
  else
    # 変更なし
  end

  rs << as3[2]

end

rs.each do |r|
  puts r
end
