#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"

$debug = !ARGV[0].nil?

S = STDIN.gets.chomp


def check
  ss = S.split('')

  return false if ss.length % 2 == 1
  
  n = ss.length / 2

  n.times do |i|
    return false unless ss[i * 2] == ss[i * 2 + 1]
  end

  return true if ss.uniq.length == n
  false
end


puts check ? 'Yes' : 'No'
