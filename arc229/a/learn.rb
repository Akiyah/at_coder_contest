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

def f(x)
  r = 0
  # pp(x:, r:)
  while x.index('ARC')
    x.sub!('ARC', 'CRA')
    # pp(x:, r:)
    r += 1
  end
  r
end

1000.times do
  x = 10.times.map { ['A', 'R', 'C'].sample }.join('')
  r = f(x.dup)

  pp(x:, 'f(x)' => r) if 4 < r
end

# CRCRCRCRCRCRCRCRCRCRCRCRCRCRCRCRCRCRCRCRCRCRCRCRCRARARARARARARARARARARARARARARARARARARARARARARARARA
