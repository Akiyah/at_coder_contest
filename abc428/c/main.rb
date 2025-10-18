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

Q = STDIN.gets.chomp.to_i
# N, A, X, Y = STDIN.gets.chomp.split.map(&:to_i)
# AS = (1..N).map do
#   STDIN.gets.chomp.to_i
#   STDIN.gets.chomp.split.map(&:to_i)
# end


rs = []
rs << ['', 0, true, true]
Q.times do
  t, c = STDIN.gets.chomp.split
  pp(t:, c:) if $debug

  if t == '1'
    c_, co_, b1_, b2_ = rs[-1]

    if b2_
      if c == '('
        co = co_ + 1
        b1 = false
        b2 = true
        rs << [c, co, b1, b2]
        puts 'No'
      else # c == ')'
        co = co_ - 1
        b1 = (0 == co)
        b2 = (0 <= co)
        rs << [c, co, b1, b2]
        puts b1 ? 'Yes' : 'No'
      end
    else # すでに正しい文字列ではない
      b1 = false
      b2 = false
      rs << [c, co, b1, b2]
      puts 'No'
    end
  else # t == '2'
    rs.pop
    c, co, b1, b2 = rs[-1]
    puts b1 ? 'Yes' : 'No'
  end
  pp(rs:) if $debug
end


