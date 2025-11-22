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

S = STDIN.gets.chomp


last_c = S[0].to_i
n = 0
ss = []
S.chars.map(&:to_i).each do |c|
  if last_c == c
    n += 1
  else
    ss << [last_c, n]
    n = 1
    last_c = c
  end
end
ss << [last_c, n]

pp(ss:) if $debug

r = 0
ss.each_cons(2) do |(c1, n1), (c2, n2)|
  if c1 + 1 == c2
    n = [n1, n2].min
    r += n
  end
end

puts r

