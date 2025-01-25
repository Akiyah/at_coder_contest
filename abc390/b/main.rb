#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"

$debug = !ARGV[0].nil?

N = STDIN.gets.chomp.to_i
AS = STDIN.gets.chomp.split.map(&:to_i)

def calc
  a0, a1 = AS[0], AS[1]

  b0 = AS[0]
  AS[1..].each do |b1|
    return false unless a1 * b0 == b1 * a0
    b0 = b1
  end
  true
end


puts calc ? 'Yes' : 'No'

