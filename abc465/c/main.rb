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
S = STDIN.gets.chomp

b = true
ls = []
rs = []
S.chars.reverse.each.with_index do |c, i|
  pp(c:, i:) if $debug
  if c == 'o'
    b = !b
  else
  end
  pp(b:) if $debug

  if b
    rs << N - i
  else
    ls << N - i
  end
  pp(ls:, rs:) if $debug
end

puts (ls + rs.reverse).join(' ')
