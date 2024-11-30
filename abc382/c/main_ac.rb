#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"

$debug = !ARGV[0].nil?

# N = STDIN.gets.chomp.to_i
# N, A, X, Y = STDIN.gets.chomp.split.map(&:to_i)
# AS = (1..N).map do
#   STDIN.gets.chomp.to_i
#   STDIN.gets.chomp.split.map(&:to_i)
# end


N, M = STDIN.gets.chomp.split.map(&:to_i)
AS = STDIN.gets.chomp.split.map(&:to_i)
BS = STDIN.gets.chomp.split.map(&:to_i)

ais = []
a_last = nil
AS.zip(1..N).each do |a, i|
  if a_last == nil || a < a_last
    ais << [a, i]
    a_last = a
  end
end


bis = BS.zip(1..M).sort.reverse

pp ais if $debug
pp bis if $debug

def calc(ais, bis)
  max_k = 0
  rs = {}
  bis.each do |b, i|
    k = ais[max_k..].find_index { |a, k| a <= b }
    if k
      pp [[b, i], k, max_k] if $debug
      rs[i] = ais[max_k + k]
      max_k += k
    else
      break
    end
  end

  pp rs if $debug

  rs2 = (1..M).map do |i|
    if rs[i]
      a, j = rs[i]
      j
    else
      -1
    end
  end
  rs2
end


rs = calc(ais, bis)

rs.each do |r|
  puts r
end
