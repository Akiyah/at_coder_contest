#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"

$debug = !ARGV[0].nil?

N = STDIN.gets.chomp.to_i
KAS = (1..N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end

pp N if $debug
pp KAS if $debug

def calc(i, j)
  k1, *as1 = KAS[i - 1]
  k2, *as2 = KAS[j - 1]

  r = 0
  as1.each do |a1|
    as2.each do |a2|
      r += 1 if a1 == a2
    end
  end
  
  r.to_f / (k1 * k2)
end



rs = (1..N).to_a.combination(2).map do |i, j|
  [calc(i, j), i, j]
end

pp rs if $debug

puts rs.map{|r, i, j| r}.max

