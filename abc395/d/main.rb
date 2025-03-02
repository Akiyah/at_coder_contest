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
OPS = (1..Q).map do
  STDIN.gets.chomp.split
end


ps = (0..N).to_a # 鳩->巣
ss = (0..N).to_a # 巣->巣番号
rss = (0..N).to_a # 巣番号->巣

OPS.each do |i, a, b|
  if i == '1'
    a = a.to_i # 鳩
    b = b.to_i # 巣番号
    ps[a] = rss[b]
  elsif i == '2'
    a = a.to_i # 巣番号
    b = b.to_i # 巣番号
    a1 = rss[a] # 巣
    b1 = rss[b] # 巣
    ss[a1], ss[b1] = ss[b1], ss[a1]
    rss[ss[a1]] = a1
    rss[ss[b1]] = b1
  else # i == '3'
    a = a.to_i # 鳩
    puts ss[ps[a]]
  end

  p [i, a, b] if $debug
  p ps if $debug
  p ss if $debug
  p rss if $debug
  p '---' if $debug  
end

