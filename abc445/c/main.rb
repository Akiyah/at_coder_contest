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

rev_paths = {}
dp = []
AS.each.with_index do |a, i|
  if i == a - 1
    dp << [i, i]
  else
    rev_paths[a - 1] ||= []
    rev_paths[a - 1] << i
  end
end
pp(rev_paths:) if $debug



def update(dp, rev_paths)
  rs = []
  while 0 < dp.length
    pp(dp:) if $debug
    pp(rs:) if $debug
    dp_new = []
    dp.each do |j, i|
      rs[j] = i
      if rev_paths[j]
        rev_paths[j].each do |k|
          dp_new << [k, i]
        end
      end
    end
    dp = dp_new
  end
  rs
end

rs = update(dp, rev_paths)
pp(rs:) if $debug

puts rs.map { |r| r + 1 }.join(' ')





