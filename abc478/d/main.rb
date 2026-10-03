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

N, Q = STDIN.gets.chomp.split.map(&:to_i)
LRXS = (1..Q).map do
  STDIN.gets.chomp.split.map(&:to_i)
end


ls = []
rs = []
LRXS.each do |l, r, x|
  ls[l] ||= []
  ls[l] << x
  rs[r] ||= []
  rs[r] << x
end
pp(ls:, rs:) if $debug

anss = []
count_x = Array.new(Q + 1, 0)
count = 0
(1..N).each do |i|
  pp(i:, 'ls[i]' => ls[i], 'rs[i]' => rs[i]) if $debug
  pp(count:, count_x:) if $debug
  (ls[i] || []).each do |x|
    count += 1 if count_x[x] == 0
    count_x[x] += 1
  end

  pp(count:, count_x:) if $debug
  anss << count

  (rs[i] || []).each do |x|
    count_x[x] -= 1
    count -= 1 if count_x[x] == 0
  end
  pp(count:, count_x:) if $debug
end



puts anss.join(' ')





