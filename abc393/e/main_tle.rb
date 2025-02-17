#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"
require 'prime'


$debug = !ARGV[0].nil?

N, K = STDIN.gets.chomp.split.map(&:to_i)
AS = STDIN.gets.chomp.split.map(&:to_i)



def divisions_pd(pd)
  if pd.length == 0
    return [1]
  end

  p, i = pd[0]

  (0..i).map do |j|
    divisions_pd(pd[1..]).map { |a| a * (p ** j) }
  end.flatten
end

def divisions(a)
  pd = Prime.prime_division(a)
  divisions_pd(pd)
end

def calc
  # pq = AcLibraryRb::PriorityQueue.new
  data = {}
  AS.each do |a|
    divisions(a).each do |a2|
      data[a2] = (data[a2] || 0) + 1
    end
  end

  pp({data:}) if $debug

  pq = AcLibraryRb::PriorityQueue.new(data.keys) {|x, y| x < y }
  data2 = {}
  while !pq.empty?
    a = pq.pop
    if K <= data[a]
      data2[a] = a
    else
      pd = Prime.prime_division(a)
      data2[a] = pd.map do |p, i|
        data2[a / p]
      end.max
    end
  end

  pp({data2:}) if $debug

  AS.map do |a|
    data2[a]
  end
end

ts = calc

ts.each do |i|
  puts i
end
