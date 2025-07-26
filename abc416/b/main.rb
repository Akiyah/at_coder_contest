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

ts = []
last_s = nil
S.chars do |s|
  if s == '#'
    ts << '#'
  else
    if last_s != '.'
      ts << 'o'
    else
      ts << '.'
    end
  end

  last_s = s
end

puts ts.join('')

