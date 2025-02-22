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

S = STDIN.gets.chomp.split('')

rs = []
s = 0
i = 0
while i < S.length
  if S[i] == 'W'
    if 0 < s
      s += 1
    else
      s = 1
    end
  elsif S[i] == 'A' && 0 < s
    rs << 'A' + ('C' * s)
    s = 0
  else
    if 0 < s
      rs << 'W' * s
    end
    s = 0
    rs << S[i]
  end
  i += 1
end

if 0 < s
  rs << 'W' * s
end

puts rs.join('')
